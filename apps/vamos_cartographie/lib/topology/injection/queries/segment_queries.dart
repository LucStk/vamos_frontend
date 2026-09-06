import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/map_state_provider.dart';
import '/topology/injection/injection.dart';

part 'segment_queries.g.dart';

@riverpod
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

@riverpod
SegmentFields? segment(Ref ref, TripId tripId, SegmentId id) {
  final node = ref.watch(segmentStoreProvider(tripId).select((s) => s.get(id)));
  return node?.current;
}

@riverpod
List<SegmentFields> allSegments(Ref ref, TripId tripId) {
  final store = ref.watch(segmentStoreProvider(tripId));
  return store.store.values.map((s) => s.current).toList();
}

@riverpod
bool isSegmentSelected(Ref ref, TripId tripId, SegmentId segId) {
  return ref.watch(
    mapStateProvider(tripId).select((s) {
      return switch (s.selection) {
        MapSegment e => (segId == e.segment.id),
        _ => false,
      };
    }),
  );
}
