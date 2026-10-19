import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/core/geometry_mappers/position_mapper.dart';
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
    GEditRoutePayloadFragmentData data,
  ) {
    return switch (data) {
      GEditRoutePayloadFragmentData__asEditRouteSuccess(
        :final trip,
        :final refinementError,
      ) =>
        Right(
          EditRoutePayload(
            route: trip.toDomain().route,
            sections: trip.toDomain().sections,
          ),
        ),
      GEditRoutePayloadFragmentData__asEditRouteError(:final code) => Left(
        switch (code) {
          GRouteEditErrorCode.STALE_ROUTE => StaleRouteFailure(),
          GRouteEditErrorCode.INVALID_ANCHOR => InvalidRouteAnchorFailure(),
          GRouteEditErrorCode.INVALID_EDIT => InvalidRouteEditFailure(),
          GRouteEditErrorCode.TRIP_NOT_FOUND => RouteTripNotFoundFailure(),
          _ => UnexpectedFailure(),
        },
      ),
      _ => Left(UnexpectedFailure()),
    };
  }

  @override
  Future<Either<Failure, EditRoutePayload>> drawRoute({
    required TripId tripId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  }) async {
    final res = await guard(
      () => remote.drawRoute(
        geometry: geometry,
        mobilityType: mobilityType,
        tripId: tripId,
      ),
    );
    return res.flatMap(_mapEditRoute);
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
