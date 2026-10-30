import 'package:dartz/dartz.dart' hide id;
import 'package:domain_core/map_geo_bounds.dart';
import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mappers/geo_polygon_dto.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/route/data/graphql/graphql.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/mobility_type_mapper.dart';
import 'package:vamos_cartographie/domain_features/route/data/route_failures.dart';

extension GeoPolygoneMapper on GeoPolygonDto {
  MapLatLngBounds toBounds() => MapLatLngBounds.fromPoints(
    rings.expand((ring) => ring).map((c) => LatLng(c[1], c[0])),
  );
}

extension RouteSectionMapper on GRouteSection {
  RouteSectionRemoteModel toDomain() => RouteSectionRemoteModel(
    id: SectionId(id),
    startIndex: startIndex,
    mobilityType: mobilityType.toDomain(),
  );
}

extension GTripRouteFieldsMapper on GTripRoute {
  RoutePayload toDomain() {
    final r = RouteRemoteModel(
      startPoint: startPoint.toLatLng(),
      geometry: route.toDomain(),
      id: TripId(id),
      bounds: bounds?.toBounds(),
    );
    return RoutePayload(
      route: r,
      sections: sections.map((m) => m.toDomain()).toList(),
    );
  }
}

extension GEditRouteResultMapper on GEditRouteResult {
  Either<RouteEditFailure, EditRoutePayload> toDomain() => switch (this) {
    final GEditRouteResult__asEditRouteSuccess s => Right(_toPayload(s)),
    final GEditRouteResult__asEditRouteError e => Left(
      routeEditFailureFor(e.code, e.message),
    ),
    _ => Left(UnknownRouteEditFailure(code: G__typename)),
  };
}

EditRoutePayload _toPayload(GEditRouteResult__asEditRouteSuccess data) {
  final domain = data.trip.toDomain();
  return EditRoutePayload(route: domain.route, sections: domain.sections);
}

@visibleForTesting
RouteEditFailure routeEditFailureFor(
  GRouteEditErrorCode code,
  String message,
) => switch (code) {
  GRouteEditErrorCode.STALE_ROUTE => StaleRouteFailure(serverMessage: message),
  GRouteEditErrorCode.INVALID_ANCHOR => InvalidRouteAnchorFailure(
    serverMessage: message,
  ),
  GRouteEditErrorCode.INVALID_EDIT => InvalidRouteEditFailure(
    serverMessage: message,
  ),
  GRouteEditErrorCode.TRIP_NOT_FOUND => RouteTripNotFoundFailure(
    serverMessage: message,
  ),
  _ => UnknownRouteEditFailure(code: code.name, serverMessage: message),
};
