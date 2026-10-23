import 'package:dartz/dartz.dart' hide id;
import 'package:domain_core/failures.dart';
import 'package:domain_core/map_geo_bounds.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/geometry_mappers/geo_polygon_dto.dart';
import 'package:vamos_cartographie/core/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/route/data/graphql/graphql.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/mobility_type_mapper.dart';
import 'package:vamos_cartographie/domain_features/route/data/route_failures.dart';

extension RouteAnchorMapper on RouteAnchor {
  GRouteAnchorInput toGQL() =>
      GRouteAnchorInput(point: position.toGQLInput(), sectionId: id.value);
}

extension GeoPolygoneMapper on GeoPolygonDto {
  MapLatLngBounds toBounds() => MapLatLngBounds.fromPoints(
    rings.expand((ring) => ring).map((c) => LatLng(c[1], c[0])),
  );
}

extension RouteSectionMapper on GRouteSectionFields {
  RouteSectionRemoteModel toDomain() => RouteSectionRemoteModel(
    id: SectionId(id),
    startIndex: startIndex,
    mobilityType: mobilityType.toDomain(),
  );
}

extension GTripRouteFieldsMapper on GTripRouteFields {
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

extension GEditRoutePayloadFragmetMapper on GEditRoutePayloadFragment {
  Either<Failure, EditRoutePayload> toDomain() {
    return switch (this) {
      final GEditRoutePayloadFragment__asEditRouteSuccess success =>
        Right<Failure, EditRoutePayload>(_toPayload(success)),
      GEditRoutePayloadFragment__asEditRouteError(:final code) =>
        Left<Failure, EditRoutePayload>(_failureFor(code)),
      _ => Left<Failure, EditRoutePayload>(UnexpectedFailure()),
    };
  }
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
