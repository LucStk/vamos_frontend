import 'package:domain_core/map_geo_bounds.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/geometry_mappers/geo_polygon_dto.dart';
import 'package:vamos_cartographie/core/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/route/data/graphql/graphql.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/mobility_type_mapper.dart';

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
