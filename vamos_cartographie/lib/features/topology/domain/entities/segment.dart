// Importe tes fichiers générés par Ferry en haut
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import "../types/segment_type.dart";
// Remplace par le bon package de ton projet (ex: google_maps_flutter ou latlong2)
part 'segment.freezed.dart';

@freezed
abstract class Segment with _$Segment {
  const factory Segment({
    required int id,
    required int startVertexId,
    required int endVertexId,
    @Default([]) List<LatLng> geometry,

    @Default(SegmentType.bike) SegmentType type,
  }) = _Segment;

  const Segment._();
  SegmentDraft toDraft() {
    return SegmentDraft(
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      type: type,
      geometry: geometry,
    );
  }
}

@freezed
abstract class SegmentDraft with _$SegmentDraft {
  const factory SegmentDraft({
    required int startVertexId,
    required int endVertexId,
    List<LatLng>? geometry,
    @Default(SegmentType.bike) SegmentType type,
  }) = _SegmentDraft;

  const SegmentDraft._();

  Segment toSegment(int id, List<LatLng> geometry) {
    return Segment(
      id: id,
      type: type,
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      geometry: geometry,
    );
  }
}
