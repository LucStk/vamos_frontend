import 'package:domain_core/domain_core.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/topology/injection/injection.dart';

part 'segment_queries.g.dart';

@Riverpod(keepAlive: true)
GraphNode<SegmentFields> segmentNode(Ref ref, TripId tripId, SegmentId id) {
  final node = ref.watch(
    segmentStoreProvider(tripId).select((s) {
      return s.get(id);
    }),
  );
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "segmentNode", resourceId: "$id"),
    );
  }
  return node;
}

@Riverpod(keepAlive: true)
SegmentFields segment(Ref ref, TripId tripId, SegmentId id) {
  return ref.watch(segmentNodeProvider(tripId, id).select((s) => s.current));
}

@Riverpod(keepAlive: true)
List<SegmentFields> allSegments(Ref ref, TripId tripId) {
  final store = ref.watch(segmentStoreProvider(tripId));
  return store.store.values.map((s) => s.current).toList();
}

// @riverpod
// bool isSegmentSelected(Ref ref, TripId tripId, SegmentId segId) {
//   return ref.watch(
//     mapStateProvider(tripId).select((s) {
//       return switch (s.selection) {
//         MapSegment e => (segId == e.segment.id),
//         _ => false,
//       };
//     }),
//   );
// }
