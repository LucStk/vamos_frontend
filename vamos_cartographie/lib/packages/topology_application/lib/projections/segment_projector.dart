import 'package:topology_application/helpers/gis.dart';
import 'package:topology_application/patches/patch_store.dart';
import 'package:topology_application/read_models/segment_ui_model.dart';
import 'package:topology_engine/graph/graph_store.dart';

class SegmentProjector {
  final GraphStore graph;
  final PatchStore patches;
  SegmentProjector({required this.graph, required this.patches});

  SegmentUiModel project(SegmentId id) {
    final patch = patches.getSegment(id);

    final geometry =
        patch?.geometryOverride ?? graph.segmentStore.getRequired(id).geometry;

    return SegmentUiModel(
      geometry: geometry,
      mobilityMarker: [boundsCenter(geometry)],
      isOptimistic: patch != null,
    );
  }
}
