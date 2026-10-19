import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/route_edit_exceptions_mappers.dart';
import 'package:vamos_cartographie/domain_features/route/data/route_remote_datasource.dart';

Future<Either<Failure, T>> guardRouteEdit<T>(Future<T> Function() action) =>
    guard(action, graphqlMapper: routeEditFailureFromGraphQLErrors);

class RouteRepositoryImpl extends RouteRepository {
  final RouteRemoteDatasource remote;

  RouteRepositoryImpl(this.remote);
  @override
  Future<Either<Failure, EditRoutePayload>> drawRoute({
    required TripId tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  }) {
    return guard(() async {
      final r = await remote.drawRoute(
        geometry: geometry,
        mobilityType: mobilityType,
        tripId: tripId,
      );
      r.errorMessage
      return r.trip.toDomain();
    });
  }

  Future<Either<Failure, EditRoutePayload>> extendsRoute({
    required TripId tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  }) {}
  Future<Either<Failure, EditRoutePayload>> redrawRoutePortion({
    required Id<Trip> tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
    required RouteAnchor startAnchor,
    required LatLng latLng,
    RouteAnchor? endAnchor,
  }) {}
  Future<Either<Failure, EditRoutePayload>> refineSection({
    required TripId tripId,
    required SectionId sectionId,
  }) {}
  Future<Either<Failure, EditRoutePayload>> setSectionMobility({
    required TripId tripId,
    required SectionId sectionId,
    required MobilityType mobilityType,
  }) {}
}
