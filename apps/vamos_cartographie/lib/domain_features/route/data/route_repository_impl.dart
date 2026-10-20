import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/route/data/graphql/graphql.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/route_edit_exceptions_mappers.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/route_mappers.dart';
import 'package:vamos_cartographie/domain_features/route/data/route_remote_datasource.dart';
import 'package:vamos_cartographie/domain_features/route/data/route_failures.dart';

Future<Either<Failure, T>> guardRouteEdit<T>(Future<T> Function() action) =>
    guard(action, graphqlMapper: routeEditFailureFromGraphQLErrors);

class RouteRepositoryImpl extends RouteRepository {
  final RouteRemoteDatasource remote;

  RouteRepositoryImpl(this.remote);
  Either<Failure, EditRoutePayload> _mapEditRoute(
    GEditRoutePayloadFragment data,
  ) {
    return switch (data) {
      final GEditRoutePayloadFragment__asEditRouteSuccess success =>
        Right<Failure, EditRoutePayload>(_toPayload(success)),
      GEditRoutePayloadFragment__asEditRouteError(:final code) =>
        Left<Failure, EditRoutePayload>(_failureFor(code)),
      _ => Left<Failure, EditRoutePayload>(UnexpectedFailure()),
    };
  }

  EditRoutePayload _toPayload(
    GEditRoutePayloadFragment__asEditRouteSuccess data,
  ) {
    final domain = data.trip.toDomain();
    return EditRoutePayload(route: domain.route, sections: domain.sections);
  }

  Failure _failureFor(GRouteEditErrorCode code) => switch (code) {
    GRouteEditErrorCode.STALE_ROUTE => StaleRouteFailure(),
    GRouteEditErrorCode.INVALID_ANCHOR => InvalidRouteAnchorFailure(),
    GRouteEditErrorCode.INVALID_EDIT => InvalidRouteEditFailure(),
    GRouteEditErrorCode.TRIP_NOT_FOUND => RouteTripNotFoundFailure(),
    _ => UnexpectedFailure(),
  };

  @override
  Future<Either<Failure, EditRoutePayload>> drawRoute({
    required TripId tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  }) async {
    final res = await guardRouteEdit(
      () => remote.drawRoute(
        geometry: geometry,
        mobilityType: mobilityType,
        tripId: tripId,
      ),
    );
    return res.flatMap(_mapEditRoute);
  }

  @override
  Future<Either<Failure, EditRoutePayload>> extendsRoute({
    required TripId tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  }) async {
    final res = await guardRouteEdit(
      () => remote.extendsRoute(
        geometry: geometry,
        mobilityType: mobilityType,
        tripId: tripId,
      ),
    );
    return res.flatMap(_mapEditRoute);
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
    return res.flatMap(_mapEditRoute);
  }

  @override
  Future<Either<Failure, EditRoutePayload>> refineSection({
    required TripId tripId,
    required SectionId sectionId,
  }) async {
    final res = await guardRouteEdit(
      () => remote.refineSection(sectionId: sectionId, tripId: tripId),
    );
    return res.flatMap(_mapEditRoute);
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
    return res.flatMap(_mapEditRoute);
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
