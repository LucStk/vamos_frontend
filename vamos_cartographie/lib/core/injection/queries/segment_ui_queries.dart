import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topology_application/domain/entities/entities.dart';
import 'package:vamos_cartographie/core/injection/queries/graph_queries.dart';
import 'package:vamos_cartographie/core/injection/stores/graph_store.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/features/topology/segment_ui.dart';
part 'segment_ui_queries.g.dart';

@riverpod
List<SegmentUiId> segmentUiIds(Ref ref) {
  // Permets d'avoir tous les segment avec un granularité de rebuild à l'échelle du segment
  final segmentPatchIds =
      ref.watch(segmentPatchStoreProvider).getIds() as List<Id>;
  final segmentIds = ref.watch(segmentStoreProvider).getIds() as List<Id>;
  return segmentPatchIds.toSet().union(segmentIds.toSet()).toList()
      as List<SegmentUiId>;
}

@riverpod
SegmentUi? segmentUi(Ref ref, SegmentUiId id) {
  final SegmentPatch? segPatch = ref.watch(
    segmentPatchProvider(id as SegmentPatchId),
  );
  if (segPatch != null) {
    return segPatch.toUiModel();
  }
  final Segment? seg = ref.watch(segmentProvider(id as SegmentId));
  return seg?.toUiModel();
}
