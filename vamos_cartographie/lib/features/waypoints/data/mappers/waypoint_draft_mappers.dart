import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';

class WaypointDraftMapper {
  static GWaypointCreateInput toGQLInput(WaypointDraft w) =>
      GWaypointCreateInput(
        lat: w.latLng.latitude,
        lng: w.latLng.longitude,
        type: w.type,
        description: w.description.isNotEmpty
            ? Value.present(w.description)
            : const Value.absent(),
        title: w.title.isNotEmpty
            ? Value.present(w.title)
            : const Value.absent(),
      );
  static GWaypointUpdateInput toGQLUpdateInput(WaypointDraft w) =>
      GWaypointUpdateInput(
        lat: Value.present(w.latLng.latitude),
        lng: Value.present(w.latLng.longitude),
        type: Value.present(w.type),
        description: w.description.isNotEmpty
            ? Value.present(w.description)
            : const Value.absent(),
        title: w.title.isNotEmpty
            ? Value.present(w.title)
            : const Value.absent(),
      );
}
