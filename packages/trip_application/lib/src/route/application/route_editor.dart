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
      ),
    );
  }

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
