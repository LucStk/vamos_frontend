import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/services/add_listener_to_observable.dart';
import '/topology/injection/injection.dart';

part 'segment_queries.g.dart';

@riverpod
ObservableGraphNode<Segment> segmentNode(Ref ref, SegmentId id) {
  final store = ref.watch(segmentStoreProvider);
  final node = store.getNode(id);
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "segmentNode", resourceId: "$id"),
    );
  }
  addListenerRebuild(ref, node); // notifyListeners(), PAS invalidateSelf()
  return node;
}

@riverpod
ObservableGraphNode<SegmentPatch> segmentPatchNode(
  Ref ref,
  Id<SegmentPatch> id,
) {
  final store = ref.watch(segmentPatchStoreProvider);
  final node = store.getNode(id);
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "segmentPatchNode", resourceId: "$id"),
    );
  }
  addListenerRebuild(ref, node); // notifyListeners(), PAS invalidateSelf()
  return node;
}

@riverpod
Segment segment(Ref ref, SegmentId id) {
  final node = ref.watch(segmentNodeProvider(id));
  return node.value;
}

@riverpod
SegmentPatch segmentPatch(Ref ref, Id<SegmentPatch> id) {
  final node = ref.watch(segmentPatchNodeProvider(id));
  return node.value;
}

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
