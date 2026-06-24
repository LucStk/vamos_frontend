import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topology_application/domain/entities/entities.dart';
import 'package:vamos_cartographie/core/injection/queries/graph_queries.dart';
import 'package:vamos_cartographie/core/injection/stores/graph_store.dart';
import 'package:trip_domain/trip_domain.dart';
part 'segment_ui_queries.g.dart';

@riverpod
Map<Id, SegmentUiModel> segmentsUi(Ref ref, TripId tripId, SegmentId segId) {
  // Permets d'avoir tous les segment avec un granularité de rebuild à l'échelle du segment
  final segmentStore = ref.watch(segmentStoreProvider);
  final patchStore = ref.watch(segmentPatchStoreProvider);
  final segmentPatchIds = patchStore.getIds() as List<Id>;
  final segmentIds = segmentStore.getIds() as List<Id>;
  final onlyInSegmentsIds =
      segmentIds.toSet().difference(segmentPatchIds.toSet()).toList()
          as List<SegmentId>;
  final Map<Id, SegmentUiModel> r = {};
  for (Id<Segment> id in onlyInSegmentsIds) {
    final seg = ref.watch(segmentProvider(id));
    if (seg == null) continue;
    final sUi = seg.toUiModel();
    r[sUi.id] = sUi;
  }
  for (Id<SegmentPatch> id in (segmentPatchIds as List<Id<SegmentPatch>>)) {
    final seg = ref.watch(segmentPatchProvider(id));
    if (seg == null) continue;
    final sUi = seg.toUiModel();
    r[sUi.id] = sUi;
  }
  return r;
}
