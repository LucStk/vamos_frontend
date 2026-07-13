import 'package:domain_core/geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/shared/graph_node_state.dart';
import '/topology/domain/value_objects/mobility_types.dart';
import "vertex_model.dart";
part 'segment_model.freezed.dart';

@freezed
abstract class Segment with _$Segment implements Patchable<Segment> {
  const factory Segment({
    required Id<Segment> id,
    required Id<Vertex> startVertexId,
    required Id<Vertex> endVertexId,
    required List<LatLng> geometry,
    @Default(MobilityType.bike) MobilityType mobilityType,
  }) = _Segment;

  const Segment._();

  @override
  Patch<Segment> createPatch() {
    return SegmentPatch.internal(
      id: id, // Ou une logique de conversion d'ID
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      geometryOverride: geometry,
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

  const SegmentPatch._(); // Requis pour pouvoir utiliser @Implements

  factory SegmentPatch({
    SegmentId? id,
    required Id<Vertex> startVertexId,
    required Geometry geometryOverride,
    required Id<Vertex> endVertexId,
    bool recomputing = false,
    Object? error,
    MobilityType mobilityType = MobilityType.bike,
  }) {
    final finalId = id ?? Id.generate();

    return SegmentPatch.internal(
      id: finalId,
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
      id: id, // Ou une logique de conversion d'ID
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      geometry: geometryOverride,
    );
  }
}
