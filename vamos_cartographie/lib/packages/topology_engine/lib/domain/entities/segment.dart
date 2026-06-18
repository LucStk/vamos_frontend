import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/core/type/has_id.dart';
import 'package:topology_engine/domain/types/mobility_types.dart';
import 'vertex.dart';

part 'segment.freezed.dart';

@freezed
abstract class Segment with _$Segment implements HasId<Segment> {
  const factory Segment({
    required Id<Segment> id,
    required Id<Vertex> startVertexId,
    required Id<Vertex> endVertexId,
    required List<LatLng> geometry,
    @Default(MobilityType.bike) MobilityType mobilityType,
  }) = _Segment;

  const Segment._();

  SegmentDraft toDraft() {
    return SegmentDraft(
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      mobilityType: mobilityType,
    );
  }
}

@freezed
abstract class SegmentDraft with _$SegmentDraft {
  const factory SegmentDraft({
    required Id<Vertex> startVertexId,
    required Id<Vertex> endVertexId,
    @Default(MobilityType.bike) MobilityType mobilityType,
  }) = _SegmentDraft;

  const SegmentDraft._();

  Segment toSegment(Id<Segment> id, List<LatLng> geometry) {
    return Segment(
      id: id,
      mobilityType: mobilityType,
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      geometry: geometry,
    );
  }
}
