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
  Future<Either<Failure, EditRoutePayload>> extendRoute({
    required TripId tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  }) async {
    final res = await guardRouteEdit(
      () => remote.extendRoute(
        geometry: geometry,
        mobilityType: mobilityType,
        tripId: tripId,
      ),
    );

    return res.flatMap((m) => m.toDomain());
  }

  @override
  Future<Either<Failure, EditRoutePayload>> prependRoute({
    required TripId tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  }) async {
    final res = await guardRouteEdit(
      () => remote.prependRoute(
        geometry: geometry,
        mobilityType: mobilityType,
        tripId: tripId,
      ),
    );

    return res.flatMap((m) => m.toDomain());
  }

  @override
  Future<Either<Failure, EditRoutePayload>> redrawRoutePortion({
    required Id<Trip> tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
    required RouteAnchor startAnchor,
    required LatLng latLng,
    RouteAnchor? endAnchor,
  }) async {
    final res = await guardRouteEdit(
      () => remote.redrawRoutePortion(
        geometry: geometry,
        mobilityType: mobilityType,
        tripId: tripId,
        startAnchor: startAnchor,
        latLng: latLng,
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

  // @override
  // Future<Either<Failure, EditRoutePayload>> deleteSection(
  //   SectionId sectionId,
  // ) async {
  //   final res = await guardRouteEdit(
  //     () => remote.refineSection(sectionId: sectionId, tripId: tripId),
  //   );
  //   return res.flatMap(_mapEditRoute);
  // }
}
