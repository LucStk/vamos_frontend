import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:stored_file_application/stored_file_application.dart';

import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/stored_file/data/mappers/stored_file_mappers.dart';
import 'package:vamos_cartographie/domain_features/waypoint/data/data.dart';
import 'package:vamos_cartographie/domain_features/waypoint/data/mappers/waypoint_enum_mapper.dart';

extension GWaypointFieldsMapper on GWaypointDetails {
  WaypointRemoteModel toDomain() => WaypointRemoteModel(
    id: WaypointId(id),
    position: location.toLatLng(),
    poiCategory: poiCategory.toDomain(),
    title: title,
    description: description,
    anchorPosition: anchorPosition,
  );
  Iterable<StoredFileRemoteModel> toImages() => files.map((m) => m.toDomain());
}

extension WaypointFieldsMappers on WaypointFields {
  GWaypointUpdateInput toGQLUpdateInput({
    required bool moved,
    required bool anchorEdited,
  }) => GWaypointUpdateInput(
    poiCategory: Value.present(poiCategory.toGQL()),
    description: Value.present(description),
    title: Value.present(title),
    location: moved
        ? Value.present(position.toGQLInput())
        : const Value.absent(),
    anchorPosition: anchorEdited
        ? Value.present(anchorPosition)
        : const Value.absent(),
  );
}
