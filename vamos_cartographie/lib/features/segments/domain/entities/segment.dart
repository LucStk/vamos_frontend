// Importe tes fichiers générés par Ferry en haut
import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "../types/segment_type.dart";
// Remplace par le bon package de ton projet (ex: google_maps_flutter ou latlong2)
import "segment_vertex.dart";
part 'segment.freezed.dart';

@freezed
abstract class Segment with _$Segment {
  const factory Segment({
    required int id,

    required int startWaypointId,
    required int endWaypointId,

    required List<SegmentVertex> middleVertices,

    @Default(SegmentType.bike) SegmentType type,
  }) = _Segment;

  const Segment._();
  SegmentDraft toDraft() {
    return SegmentDraft(
      startWaypointId: startWaypointId,
      endWaypointId: endWaypointId,
      middleVertices: middleVertices,
      type: type,
    );
  }
}

@freezed
abstract class SegmentDraft with _$SegmentDraft {
  const factory SegmentDraft({
    required int startWaypointId,
    required int endWaypointId,
    @Default(SegmentType.bike) SegmentType type,
    @Default([]) List<SegmentVertex> middleVertices,
  }) = _SegmentDraft;

  const SegmentDraft._();

  Segment toSegment(int id) {
    return Segment(
      id: id,
      type: type,
      middleVertices: middleVertices,
      startWaypointId: startWaypointId,
      endWaypointId: endWaypointId,
    );
  }
}
