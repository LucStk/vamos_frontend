// Importe tes fichiers générés par Ferry en haut
import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "../types/segment_type.dart";
// Remplace par le bon package de ton projet (ex: google_maps_flutter ou latlong2)

part 'segment.freezed.dart';

@freezed
abstract class Segment with _$Segment {
  const factory Segment({
    required int id,
    required int startWaypointId,
    required int endWaypointId,
    @Default(SegmentType.bike) SegmentType type,
    @Default([]) List<LatLng> geometry,
  }) = _Segment;

  const Segment._();

  SegmentDraft toDraft() {
    return SegmentDraft(
      type: type,
      geometry: geometry,
      startWaypointId: startWaypointId,
      endWaypointId: endWaypointId,
    );
  }
}

@freezed
abstract class SegmentDraft with _$SegmentDraft {
  const factory SegmentDraft({
    required int startWaypointId,
    required int endWaypointId,
    @Default(SegmentType.bike) SegmentType type,
    @Default([]) List<LatLng> geometry,
  }) = _SegmentDraft;

  const SegmentDraft._();

  Segment toSegment(int id) {
    return Segment(
      id: id,
      type: type,
      geometry: geometry,
      startWaypointId: startWaypointId,
      endWaypointId: endWaypointId,
    );
  }
}
