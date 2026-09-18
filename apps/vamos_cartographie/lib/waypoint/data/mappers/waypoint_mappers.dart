import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/waypoint/data/graphql/__generated__/waypoint_fields.data.gql.dart';
import 'package:vamos_cartographie/waypoint/data/mappers/waypoint_enum_mapper.dart';
import '/core/graphql/graphql.dart';

import 'package:trip_application/trip_application.dart';

extension GWaypointFieldsMapper on GWaypointFields {
  WaypointRemoteModel toDomain() => WaypointRemoteModel(
    id: WaypointId(id),
    vertexId: VertexId(vertex.id),
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
