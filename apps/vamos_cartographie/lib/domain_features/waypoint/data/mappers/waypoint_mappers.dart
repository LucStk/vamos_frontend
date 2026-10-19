import 'package:gql_tristate_value/gql_tristate_value.dart';

import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/waypoint/data/data.dart';
import 'package:vamos_cartographie/domain_features/waypoint/data/mappers/waypoint_enum_mapper.dart';

extension GWaypointFieldsMapper on GWaypointFields {
  WaypointRemoteModel toDomain() => WaypointRemoteModel(
    id: WaypointId(id),
    position: location.toLatLng(),
    poiCategory: poiCategory.toDomain(),
    title: title,
    description: description,
  );
}

extension WaypointFieldsMappers on WaypointFields {
  GWaypointUpdateInput toGQLUpdateInput() => GWaypointUpdateInput(
    poiCategory: Value.present(poiCategory.toGQL()),
    description: description.isNotEmpty
        ? Value.present(description)
        : const Value.absent(),
    title: title.isNotEmpty ? Value.present(title) : const Value.absent(),
  );
}
