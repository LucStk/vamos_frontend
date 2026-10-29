import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/route/application/route_store.dart';
import 'package:trip_application/src/route/domain/mobility_types.dart';
import 'package:trip_application/src/route/domain/route_repository.dart';
import 'package:trip_application/src/trip/domain/domain.dart';
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
      onSuccess: (gs, payload) => RouteStore.fromRemote(
        route: payload.route,
        sections: payload.sections,
      ),
    );
  }

  Future<Either<Failure, EditRoutePayload>> editRoute({
    required List<LatLng> geometry,
    MobilityType? mobilityType,
    RouteAnchor? startAnchor,
    RouteAnchor? endAnchor,
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
      ),
      onSuccess: (gs, payload) => RouteStore.fromRemote(
        route: payload.route,
        sections: payload.sections,
      ),
      onError: (_, failure) => null, // le logger de run() a déjà tracé l'erreur
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
        remoteSections: payload.sections,
      ),
      onError: (_, failure) => null, // le logger de run() a déjà tracé l'erreur
    );
  }
}
