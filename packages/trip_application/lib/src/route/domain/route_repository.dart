import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/route/route.dart';
import 'package:trip_application/src/trip/domain/domain.dart';

class RoutePayload {
  RoutePayload({required this.route, required this.sections});
  final RouteRemoteModel route;
  final List<RouteSectionRemoteModel> sections;
}

class EditRoutePayload {
  EditRoutePayload({required this.route, required this.sections});
  final RouteRemoteModel route;
  final List<RouteSectionRemoteModel> sections;
}

abstract class RouteRepository {
  Future<Either<Failure, EditRoutePayload>> setTripOrigin({
    required TripId tripId,
    required LatLng position,
  });

  Future<Either<Failure, EditRoutePayload>> extendRoute({
    required TripId tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  });
  Future<Either<Failure, EditRoutePayload>> prependRoute({
    required TripId tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  });
  Future<Either<Failure, EditRoutePayload>> redrawRoutePortion({
    required Id<Trip> tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
    required RouteAnchor startAnchor,
    required LatLng latLng,
    RouteAnchor? endAnchor,
  });
  Future<Either<Failure, EditRoutePayload>> refineSection({
    required TripId tripId,
    required SectionId sectionId,
  });
  Future<Either<Failure, EditRoutePayload>> setSectionMobility({
    required TripId tripId,
    required SectionId sectionId,
    required MobilityType mobilityType,
  });
  Future<Either<Failure, EditRoutePayload>> deleteRoute({
    required TripId tripId,
  });
}
