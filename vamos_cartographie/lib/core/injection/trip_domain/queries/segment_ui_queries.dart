import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/providers/graph_store.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/graph_queries.dart';

part 'segment_ui_queries.g.dart';

@riverpod
List<SegmentRef> segmentRefs(Ref ref) {
  // Permets d'avoir tous les segment avec un granularité de rebuild à l'échelle du segment
  final segmentPatchIds =
      ref.watch(segmentPatchStoreProvider).getIds() as List<Id>;
  final segmentIds = ref.watch(segmentStoreProvider).getIds() as List<Id>;
  return segmentPatchIds.toSet().union(segmentIds.toSet()).toList()
      as List<SegmentRef>;
}

@riverpod
SegmentUiModel? segmentUi(Ref ref, SegmentRef id) {
  switch (id) {
    case PendingSegmentRef e:
      final SegmentPatch? segPatch = ref.watch(segmentPatchProvider(e.id));
      return segPatch?.toUiModel();
    case ConfirmedSegmentRef e:
      final Segment? seg = ref.watch(segmentProvider(e.id));
      return seg?.toUiModel();
  }
}
