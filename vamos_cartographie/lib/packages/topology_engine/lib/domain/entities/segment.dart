import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:topology_engine/domain/entities/vertex.dart';
import 'package:topology_engine/domain/value_objects/mobility_types.dart';

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
    return SegmentDraft(mobilityType: mobilityType);
  }

  Segment copyWithDraft(SegmentDraft draft) {
    return copyWith(mobilityType: draft.mobilityType);
  }
}

@freezed
abstract class SegmentDraft with _$SegmentDraft {
  const factory SegmentDraft({
    @Default(MobilityType.bike) MobilityType mobilityType,
  }) = _SegmentDraft;

  const SegmentDraft._();
}
