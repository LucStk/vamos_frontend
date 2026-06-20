import 'package:topology_application/helpers/gis.dart';
import 'package:topology_application/patches/patch_store.dart';
import 'package:topology_application/read_models/segment_view_model.dart';
import 'package:topology_engine/domain/types/geometry.dart';
import 'package:topology_engine/graph/graph_store.dart';

class SegmentProjection {
  final GraphStore graph;
  final PatchStore patches;
  SegmentProjection({required this.graph, required this.patches});

  SegmentViewModel project(SegmentId id) {
    final segment = graph.segmentStore.getRequired(id);
    final patch = patches.get(id);

    final geometry = patch?.geometryOverride ?? segment.geometry;

    return SegmentViewModel(
      geometry: geometry,
      mobilityMarker: [boundsCenter(geometry)],
      isOptimistic: patch != null,
    );
  }
}
