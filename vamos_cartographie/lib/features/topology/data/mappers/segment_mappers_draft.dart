import 'package:vamos_cartographie/features/topology/data/mappers/segment_type_mapper.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import "package:vamos_cartographie/features/segments/domain/entities/segment.dart";

class SegmentDraftMapper {
  static GSegmentCreateInput toGQLInput(SegmentDraft s) => GSegmentCreateInput(
    type: s.type.toGQL(),
    geometry: s.geometry != null
        ? Value.present(
            s.geometry!.map((m) {
              return GLatLngInput(lat: m.latitude, lng: m.longitude);
            }).toList(),
          )
        : Value.absent(),
    startVertexId: s.startVertexId,
    endVertexId: s.endVertexId,
  );

  static GSegmentUpdateInput toGQLUpdateInput(SegmentDraft s) {
    return GSegmentUpdateInput(
      type: Value.present(s.type.toGQL()),
      startVertexId: Value.present(s.startVertexId),
      endVertexId: Value.present(s.endVertexId),
      geometry: s.geometry != null
          ? Value.present(
              s.geometry!.map((m) {
                return GLatLngInput(lat: m.latitude, lng: m.longitude);
              }).toList(),
            )
          : Value.absent(),
    );
  }
}
