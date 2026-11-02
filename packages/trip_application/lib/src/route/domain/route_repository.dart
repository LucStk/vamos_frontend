import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/route/domain/geometry_source_types.dart';
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

class PreviewSection {
  PreviewSection({
    required this.isNew,
    required this.startIndex,
    required this.mobilityType,
    required this.geometrySource,
  });
  final bool isNew;
  final int startIndex;
  final MobilityType mobilityType;
  final GeometrySource geometrySource;
}

class PreviewRoutePayload {
  PreviewRoutePayload({
    required this.proposalId,
    required this.sections,
    required this.coordinates,
  });
  final Id proposalId;
  final List<LatLng> coordinates;
  final List<PreviewSection> sections;
}

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
    required SectionId sectionId,
  });
  Future<Either<Failure, EditRoutePayload>> setSectionMobility({
    required TripId tripId,
    required SectionId sectionId,
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
