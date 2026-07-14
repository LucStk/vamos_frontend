import 'package:domain_core/geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain_core/domain_core.dart';
import '/topology/domain/value_objects/mobility_types.dart';
import "vertex_model.dart";

part 'segment_model.freezed.dart';

@freezed
abstract class Segment with _$Segment implements Patchable<Segment> {
  const factory Segment({
    required Id<Segment> id,
    required Id<Vertex> startVertexId,
    required Id<Vertex> endVertexId,
    required Geometry geometry, // <- plus List<LatLng>
    @Default(MobilityType.bike) MobilityType mobilityType,
  }) = _Segment;

  const Segment._();

  @override
  Patch<Segment> createPatch() {
    return SegmentPatch.internal(
      id: id,
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      geometryOverride: geometry,
      recomputing: false,
    );
  }
}

typedef SegmentId = Id<Segment>;

@freezed
abstract class SegmentPatch with _$SegmentPatch implements Patch<Segment> {
  @Implements<Patch<Segment>>()
  const factory SegmentPatch.internal({
    required SegmentId id,
    required Id<Vertex> startVertexId,
    required Id<Vertex> endVertexId,
    required Geometry geometryOverride,
    @Default(MobilityType.bike) MobilityType mobilityType,
    @Default(false) bool recomputing,
    Object? error,
  }) = _SegmentPatch;

  const SegmentPatch._();

  factory SegmentPatch({
    SegmentId? id,
    required Id<Vertex> startVertexId,
    required Geometry geometryOverride,
    required Id<Vertex> endVertexId,
    bool recomputing = false,
    Object? error,
    MobilityType mobilityType = MobilityType.bike,
  }) {
    return SegmentPatch.internal(
      id: id ?? Id.generate(),
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      geometryOverride: geometryOverride,
      recomputing: recomputing,
      error: error,
      mobilityType: mobilityType,
    );
  }

  @override
  Segment toEntity() {
    return Segment(
      id: id,
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      geometry: geometryOverride,
      mobilityType: mobilityType,
    ); // mobilityType manquait dans ta version d'origine
  }
}
