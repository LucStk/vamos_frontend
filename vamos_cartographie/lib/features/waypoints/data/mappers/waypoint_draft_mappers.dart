import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'waypoint_enum_mapper.dart';
import "package:latlong2/latlong.dart";
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import "package:vamos_cartographie/features/shared/shared.dart";

class WaypointDraftMapper {
  static GWaypointCreateInput toGQLInput(
    WaypointDraft waypointDraft,
    int? vertexId,
    LatLng? latlng,
  ) => GWaypointCreateInput(
    type: waypointDraft.type.toGQL(),
    description: waypointDraft.description.isNotEmpty
        ? Value.present(waypointDraft.description)
        : const Value.absent(),
    title: waypointDraft.title.isNotEmpty
        ? Value.present(waypointDraft.title)
        : const Value.absent(),
    latLng: (latlng != null)
        ? Value.present(GisMapper.toGQL(latlng))
        : const Value.absent(),
    vertexId: (vertexId != null)
        ? Value.present(vertexId)
        : const Value.absent(),
  );

  static GWaypointUpdateInput toGQLUpdateInput(WaypointDraft waypointDraft) =>
      GWaypointUpdateInput(
        type: Value.present(waypointDraft.type.toGQL()),
        description: waypointDraft.description.isNotEmpty
            ? Value.present(waypointDraft.description)
            : const Value.absent(),
        title: waypointDraft.title.isNotEmpty
            ? Value.present(waypointDraft.title)
            : const Value.absent(),
      );
}
