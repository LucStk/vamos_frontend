import 'package:trip_application/trip_application.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/core/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/topology/data/graphql/fields/__generated__/segment_fields.data.gql.dart';
import 'package:vamos_cartographie/domain_features/topology/data/mappers/mobility_type_mapper.dart';

extension GSegmentFieldsMapper on GSegmentFields {
  SegmentRemoteModel toDomain() => SegmentRemoteModel(
    id: SegmentId(id),
    mobilityType: mobilityType.toDomain(),
    geometry: geometry.map((d) => d.toLatLng()).toList(),
  );
}

extension SegmentFieldsMapper on SegmentFields {
  GSegmentUpdateInput toGQLUpdateInput() {
    return GSegmentUpdateInput(
      geometry: geometry.map((m) => m.toGQLInput()).toList(),
      mobilityType: Value.present(mobilityType.toGQL()),
    );
  }

  GSegmentCreateInput toGQLCreateInput() {
    return GSegmentCreateInput(
      mobilityType: mobilityType.toGQL(),

      geometry: geometry.map((m) => m.toGQLInput()).toList(),
    );
  }
}

extension SpliceAnchorMapper on SpliceAnchor {
  GSegmentAnchorInput toGQLSegmentAnchorInput() {
    switch (this) {
      case VertexAnchor v:
        return GSegmentAnchorInput(
          segmentId: Value.absent(),
          vertexId: Value.present(v.id.value),
        );
      case SegmentAnchor s:
        return GSegmentAnchorInput(
          segmentId: Value.present(s.id.value),
          vertexId: Value.absent(),
        );
    }
  }
}
