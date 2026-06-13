import 'package:vamos_cartographie/features/topology/data/mappers/segment_type_mapper.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';

class SegmentDraftMapper {
  static GSegmentCreateInput toGQLInput(SegmentDraft s) => GSegmentCreateInput(
    type: s.type.toGQL(),
    startVertexId: s.startVertexId.value,
    endVertexId: s.endVertexId.value,
  );

  static GSegmentUpdateInput toGQLUpdateInput(SegmentDraft s) {
    return GSegmentUpdateInput(
      type: Value.present(s.type.toGQL()),
      startVertexId: Value.present(s.startVertexId.value),
      endVertexId: Value.present(s.endVertexId.value),
    );
  }
}
