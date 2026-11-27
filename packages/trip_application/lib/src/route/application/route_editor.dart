import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/route/application/route_payloads.dart';

import 'package:trip_application/trip_application.dart';

mixin RouteEditor on OptimisticRunner<RouteStore> {
  TripId get tripId;
  RouteRepository get routeRepo;

  Future<Either<Failure, EditRoutePayload>> setTripOrigin(
    LatLng position,
  ) async {
    return await run(
      entityKey: tripId,
      onApply: (gs) => gs,
      remote: (_) =>
          routeRepo.setTripOrigin(tripId: tripId, position: position),
      onSuccess: (gs, payload) => RouteStore.fromRemote(route: payload.route),
    );
  }

  Future<Either<Failure, EditRoutePayload>> editRoute({
    required List<LatLng> geometry,
    MobilityType? mobilityType,
    RouteAnchor? startAnchor,
    RouteAnchor? endAnchor,
    bool autoRoute = true,
  }) {
    return run<EditRoutePayload, TripId>(
      entityKey: tripId, // sérialise toutes les éditions de ce trip
      onApply: (_) => null, // pas d'état optimiste : null = ne rien changer
      remote: (_) => routeRepo.editRoute(
        tripId: tripId,
        mobilityType: mobilityType,
        geometry: geometry,
        startAnchor: startAnchor,
        endAnchor: endAnchor,
        autoRoute: autoRoute,
      ),
      onSuccess: (gs, payload) => RouteStore.fromRemote(
        route: payload.route,
        mobilitySpans: payload.mobilitySpans,
        editSpans: payload.editSpans,
      ),
      onError: (_, failure) => null, // le logger de run() a déjà tracé l'erreur
    );
  }

  /// Calcule l'itinéraire du tracé sans toucher à la route : la proposition
  /// reste côté serveur jusqu'à [commitRouteEdit] ou [discardRouteProposal].
  Future<Either<Failure, PreviewRoutePayload>> previewRouteEdit({
    required List<LatLng> geometry,
    MobilityType? mobilityType,
    RouteAnchor? startAnchor,
    RouteAnchor? endAnchor,
    bool directRoute = false,
  }) {
    return run<PreviewRoutePayload, TripId>(
      entityKey: tripId, // sérialise toutes les éditions de ce trip
      onApply: (_) => null, // la route n'est pas modifiée
      remote: (_) => routeRepo.previewRouteEdit(
        tripId: tripId,
        mobilityType: mobilityType,
        geometry: geometry,
        startAnchor: startAnchor,
        endAnchor: endAnchor,
        directRoute: directRoute,
      ),
    );
  }

  /// Re-route la portion entre les positions [from] et [to] (repère de
  /// `RouteHitDetail.position`) avec [mobilityType], sans toucher à la route.
  /// La proposition se valide avec [commitRouteEdit].
  ///
  /// Les bornes sont résolues au moment où l'édition passe dans la file du
  /// trip, sur la route alors à jour.
  Future<Either<Failure, PreviewRoutePayload>> previewPortion({
    required double from,
    required double to,
    required MobilityType mobilityType,
  }) {
    return run<PreviewRoutePayload, TripId>(
      entityKey: tripId, // sérialise toutes les éditions de ce trip
      onApply: (_) => null, // la route n'est pas modifiée
      remote: (_) {
        final portion = _portionOf(from, to);
        if (portion == null) {
          return Future.value(Left<Failure, PreviewRoutePayload>(_noPortion));
        }
        return routeRepo.previewRouteEdit(
          tripId: tripId,
          mobilityType: mobilityType,
          geometry: const [], // pas de point de passage : le routeur choisit
          startAnchor: portion.start,
          endAnchor: portion.end,
        );
      },
    );
  }

  /// Donne [mobilityType] à la portion entre [from] et [to] en gardant son
  /// tracé tel quel (aucun recalcul).
  Future<Either<Failure, EditRoutePayload>> setPortionMobility({
    required double from,
    required double to,
    required MobilityType mobilityType,
  }) {
    return run<EditRoutePayload, TripId>(
      entityKey: tripId, // sérialise toutes les éditions de ce trip
      onApply: (_) => null, // pas d'état optimiste : null = ne rien changer
      remote: (_) {
        final portion = _portionOf(from, to);
        if (portion == null) {
          return Future.value(Left<Failure, EditRoutePayload>(_noPortion));
        }
        return routeRepo.setRangeMobility(
          tripId: tripId,
          start: portion.start,
          end: portion.end,
          mobilityType: mobilityType,
        );
      },
      onSuccess: (gs, payload) => gs.replacedByServer(
        remoteRoute: payload.route,
        remoteMobilitySpans: payload.mobilitySpans,
        remoteEditSpans: payload.editSpans,
      ),
      onError: (_, failure) => null, // le logger de run() a déjà tracé l'erreur
    );
  }

  RoutePortion? _portionOf(double from, double to) {
    final route = state.route?.current;
    if (route == null) return null;
    return portionAnchors(
      geometry: route.geometry,
      mobilitySpans: [...state.mobilitySpans.store.values.map((n) => n.current)]
        ..sort((a, b) => a.startIndex.compareTo(b.startIndex)),
      from: from,
      to: to,
    );
  }

  static final _noPortion = NotFoundFailure(resourceType: 'route');

  /// Intègre à la route la proposition renvoyée par [previewRouteEdit].
  Future<Either<Failure, EditRoutePayload>> commitRouteEdit({
    required Id proposalId,
  }) {
    return run<EditRoutePayload, TripId>(
      entityKey: tripId, // sérialise toutes les éditions de ce trip
      onApply: (_) => null, // pas d'état optimiste : null = ne rien changer
      remote: (_) =>
          routeRepo.commitRouteEdit(tripId: tripId, proposalId: proposalId),
      onSuccess: (gs, payload) => RouteStore.fromRemote(
        route: payload.route,
        mobilitySpans: payload.mobilitySpans,
        editSpans: payload.editSpans,
      ),
      onError: (_, failure) => null, // le logger de run() a déjà tracé l'erreur
    );
  }

  /// Abandonne la proposition en cours. Passe par la file du trip : elle ne
  /// peut pas doubler une prévisualisation demandée juste après.
  Future<Either<Failure, Unit>> discardRouteProposal() {
    return run<Unit, TripId>(
      entityKey: tripId,
      onApply: (_) => null,
      remote: (_) async {
        final failure = await routeRepo.discardRouteProposal(tripId: tripId);
        return failure == null ? const Right(unit) : Left(failure);
      },
    );
  }

  Future<Either<Failure, EditRoutePayload>> deleteRoute({
    required TripId tripId,
  }) {
    return run<EditRoutePayload, TripId>(
      entityKey: tripId, // sérialise toutes les éditions de ce trip
      onApply: (_) => null, // pas d'état optimiste : null = ne rien changer
      remote: (_) => routeRepo.deleteRoute(tripId),
      onSuccess: (gs, payload) => gs.replacedByServer(
        remoteRoute: payload.route,
        remoteMobilitySpans: payload.mobilitySpans,
        remoteEditSpans: payload.editSpans,
      ),
      onError: (_, failure) => null, // le logger de run() a déjà tracé l'erreur
    );
  }

  Future<Either<Failure, EditRoutePayload>> trimRoute({
    required EndpointAnchor end,
    required double lengthM,
  }) {
    return run<EditRoutePayload, TripId>(
      entityKey: tripId, // sérialise toutes les éditions de ce trip
      onApply: (_) => null, // pas d'état optimiste : null = ne rien changer
      remote: (_) =>
          routeRepo.trimRoute(tripId: tripId, end: end, lengthM: lengthM),
      onSuccess: (gs, payload) => gs.replacedByServer(
        remoteRoute: payload.route,
        remoteMobilitySpans: payload.mobilitySpans,
        remoteEditSpans: payload.editSpans,
      ),
      onError: (_, failure) => null, // le logger de run() a déjà tracé l'erreur
    );
  }
}
