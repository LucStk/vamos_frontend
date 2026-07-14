import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import '/topology/injection/injection.dart';

part 'segment_queries.g.dart';

@riverpod
GraphNode<Segment> segmentNode(Ref ref, SegmentId id) {
  final store = ref.watch(segmentStoreProvider);
  final node = store.getNode(id);
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "segmentNode", resourceId: "$id"),
    );
  }
  return node as GraphNode<Segment>;
}

@riverpod
NodeState<Segment> segment(Ref ref, SegmentId id) {
  final node = ref.watch(segmentNodeProvider(id));
  return node.current;
}
