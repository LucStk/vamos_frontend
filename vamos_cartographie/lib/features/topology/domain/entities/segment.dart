// Importe tes fichiers générés par Ferry en haut
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import "package:vamos_cartographie/core/type/has_id.dart";
// Remplace par le bon package de ton projet (ex: google_maps_flutter ou latlong2)
part 'segment.freezed.dart';

@freezed
abstract class Segment with _$Segment implements HasId<Segment> {
  const factory Segment({
    required Id<Segment> id,
    required Id<Vertex> startVertexId,
    required Id<Vertex> endVertexId,
    required List<LatLng> geometry,
    @Default(SegmentType.bike) SegmentType type,
  }) = _Segment;

  const Segment._();
  SegmentDraft toDraft() {
    return SegmentDraft(
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      type: type,
    );
  }
}

@freezed
abstract class SegmentDraft with _$SegmentDraft {
  const factory SegmentDraft({
    required Id<Vertex> startVertexId,
    required Id<Vertex> endVertexId,
    @Default(SegmentType.bike) SegmentType type,
  }) = _SegmentDraft;

  const SegmentDraft._();

  Segment toSegment(Id<Segment> id, List<LatLng> geometry) {
    return Segment(
      id: id,
      type: type,
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      geometry: geometry,
    );
  }
}
