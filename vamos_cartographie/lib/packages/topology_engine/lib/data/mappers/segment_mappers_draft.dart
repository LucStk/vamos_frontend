import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:topology_engine/domain/domain.dart';

import "mobility_type_mapper.dart";

class SegmentDraftMapper {
  static GSegmentCreateInput toGQLInput(SegmentDraft s) => GSegmentCreateInput(
    mobilityType: s.mobilityType.toGQL(),
    startVertexId: s.startVertexId.value,
    endVertexId: s.endVertexId.value,
  );

  static GSegmentUpdateInput toGQLUpdateInput(SegmentDraft s) {
    return GSegmentUpdateInput(
      mobilityType: Value.present(s.mobilityType.toGQL()),
      startVertexId: Value.present(s.startVertexId.value),
      endVertexId: Value.present(s.endVertexId.value),
    );
  }
}
