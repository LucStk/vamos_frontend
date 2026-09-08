import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/mappers/mappers.dart';
import 'package:vamos_cartographie/topology/data/mappers/mappers.dart';
import '/core/graphql/graphql.dart';
import "/topology/data/graphql/graphql.dart";
import 'package:gql_tristate_value/gql_tristate_value.dart';

extension GSegmentFieldsMapper on GSegmentFields {
  SegmentRemoteModel toSegmentRemoteModel() => SegmentRemoteModel(
    id: SegmentId(id),
    mobilityType: mobilityType.toDomain(),
    geometry: geometry.map((d) => d.toLatLng()).toList(),
    startVertexId: VertexId(startVertex.id),
    endVertexId: VertexId(endVertex.id),
  );
  VertexRemoteModel toEndVertexRemoteModel() => endVertex.toVertexRemoteModel();
}

extension GCreateSegmentPayloadFragmentMapper on GCreateSegmentPayloadFragment {
  CreateSegmentPayload toCreateSegmentPayload() => CreateSegmentPayload(
    rafinementFailed: refinementFailed,
    segment: segment.toSegmentRemoteModel(),
    vertex: vertex.toVertexRemoteModel(),
    errorMessage: errorMessage,
  );
}

extension GRefineSegmentPayloadMapper on GRefineSegmentPayloadFragment {
  RefineSegmentPayload toRefinePayload() => RefineSegmentPayload(
    rafinementFailed: refinementFailed,
    segment: segment.toSegmentRemoteModel(),
    errorMessage: errorMessage,
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
      startVertexId: startVertexId.value,
      endVertexId: Value.present(endVertexId.value),
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
