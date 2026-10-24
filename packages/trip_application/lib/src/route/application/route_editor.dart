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

  Future<Either<Failure, Trip>> moveStartPoint(RouteFields route) async {
    return await run(
      entityKey: trip.id,
      onApply: (gs) => gs,
      remote: (_) => tripRepo.updateTrip(trip),
      onSuccess: (gs, Trip serverTrip) => gs.insertTrip(serverTrip),
    );
  }

  Future<Either<Failure, EditRoutePayload>> extendRoute({
    required List<LatLng> geometry,
    required MobilityType mobilityType,
  }) {
    return run<EditRoutePayload, TripId>(
      entityKey: tripId, // sérialise toutes les éditions de ce trip
      onApply: (_) => null, // pas d'état optimiste : null = ne rien changer
      remote: (_) => routeRepo.extendRoute(
        tripId: tripId,
        mobilityType: mobilityType,
        geometry: geometry,
      ),
      onSuccess: (gs, payload) => gs.replacedByServer(
        remoteRoute: payload.route,
        remoteSections: payload.sections,
      ),
      onError: (_, failure) => null, // le logger de run() a déjà tracé l'erreur
    );
  }

  Future<Either<Failure, EditRoutePayload>> prependRoute({
    required List<LatLng> geometry,
    required MobilityType mobilityType,
  }) {
    return run<EditRoutePayload, TripId>(
      entityKey: tripId, // sérialise toutes les éditions de ce trip
      onApply: (_) => null, // pas d'état optimiste : null = ne rien changer
      remote: (_) => routeRepo.prependRoute(
        tripId: tripId,
        mobilityType: mobilityType,
        geometry: geometry,
      ),
      onSuccess: (gs, payload) => gs.replacedByServer(
        remoteRoute: payload.route,
        remoteSections: payload.sections,
      ),
      onError: (_, failure) => null, // le logger de run() a déjà tracé l'erreur
    );
  }
}
