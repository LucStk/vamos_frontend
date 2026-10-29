import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/route_edit_exceptions_mappers.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/route_mappers.dart';
import 'package:vamos_cartographie/domain_features/route/data/route_remote_datasource.dart';

Future<Either<Failure, T>> guardRouteEdit<T>(Future<T> Function() action) =>
    guard(action, graphqlMapper: routeEditFailureFromGraphQLErrors);

class RouteRepositoryImpl extends RouteRepository {
  final RouteRemoteDatasource remote;

  RouteRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, EditRoutePayload>> setTripOrigin({
    required TripId tripId,
    required LatLng position,
  }) async {
    final res = await guardRouteEdit(
      () => remote.setTripOrigin(tripId: tripId, position: position),
    );

    return res.flatMap((m) => m.toDomain());
  }

  @override
  Future<Either<Failure, EditRoutePayload>> editRoute({
    required Id<Trip> tripId,
    required List<LatLng> geometry,
    MobilityType? mobilityType,
    RouteAnchor? startAnchor,
    RouteAnchor? endAnchor,
  }) async {
    final res = await guardRouteEdit(
      () => remote.editRoute(
        geometry: geometry,
        mobilityType: mobilityType,
        tripId: tripId,
        startAnchor: startAnchor,
        endAnchor: endAnchor,
      ),
    );
    return res.flatMap((m) => m.toDomain());
  }

  @override
  Future<Either<Failure, EditRoutePayload>> refineSection({
    required TripId tripId,
    required SectionId sectionId,
  }) async {
    final res = await guardRouteEdit(
      () => remote.refineSection(sectionId: sectionId, tripId: tripId),
    );

    return res.flatMap((m) => m.toDomain());
  }

  @override
  Future<Either<Failure, EditRoutePayload>> setSectionMobility({
    required TripId tripId,
    required SectionId sectionId,
    required MobilityType mobilityType,
  }) async {
    final res = await guardRouteEdit(
      () => remote.setSectionMobility(
        mobilityType: mobilityType,
        sectionId: sectionId,
        tripId: tripId,
      ),
    );

    return res.flatMap((m) => m.toDomain());
  }

  @override
  Future<Either<Failure, EditRoutePayload>> deleteRoute(TripId tripId) async {
    final res = await guardRouteEdit(() => remote.deleteRoute(tripId: tripId));
    return res.flatMap((m) => m.toDomain());
  }
}
