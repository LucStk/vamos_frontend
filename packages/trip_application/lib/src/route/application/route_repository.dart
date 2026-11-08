import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/route/route.dart';
import 'package:trip_application/src/trip/trip.dart';

abstract class RouteRepository {
  Future<Either<Failure, EditRoutePayload>> setTripOrigin({
    required TripId tripId,
    required LatLng position,
  });

  Future<Either<Failure, EditRoutePayload>> editRoute({
    required Id<Trip> tripId,
    required List<LatLng> geometry,
    MobilityType? mobilityType,
    RouteAnchor? startAnchor,
    RouteAnchor? endAnchor,
  });
  Future<Either<Failure, EditRoutePayload>> refineSection({
    required TripId tripId,
    required SpanId sectionId,
  });
  Future<Either<Failure, EditRoutePayload>> setSectionMobility({
    required TripId tripId,
    required SpanId sectionId,
    required MobilityType mobilityType,
  });
  Future<Either<Failure, EditRoutePayload>> deleteRoute(TripId tripId);
  Future<Either<Failure, PreviewRoutePayload>> previewRouteEdit({
    required Id<Trip> tripId,
    required List<LatLng> geometry,
    MobilityType? mobilityType,
    RouteAnchor? startAnchor,
    RouteAnchor? endAnchor,
  });
  Future<Either<Failure, EditRoutePayload>> commitRouteEdit({
    required Id<Trip> tripId,
    required Id proposalId,
  });

  Future<Failure?> discardRouteProposal({required Id<Trip> tripId});
}
