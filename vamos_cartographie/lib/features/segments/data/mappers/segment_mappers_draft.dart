import 'package:vamos_cartographie/features/segments/data/mappers/segment_type_mapper.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import "package:vamos_cartographie/features/segments/domain/entities/segment.dart";

class SegmentDraftMapper {
  static GSegmentCreateInput toGQLInput(SegmentDraft s) => GSegmentCreateInput(
    type: s.type.toGQL(),
    geometry: [],
    startWaypointId: s.startWaypointId,
    endWaypointId: s.endWaypointId,
  );

  static GSegmentUpdateInput toGQLUpdateInput(SegmentDraft s) =>
      GSegmentUpdateInput(type: Value.present(s.type.toGQL()));
}
