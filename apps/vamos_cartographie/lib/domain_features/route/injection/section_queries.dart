import 'package:domain_core/domain_core.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';

part 'section_queries.g.dart';

@Riverpod(keepAlive: true)
GraphNode<RouteSectionFields> sectionNode(
  Ref ref,
  TripId tripId,
  SectionId id,
) {
  final node = ref.watch(
    routeStoreProvider(tripId).select((s) {
      return s.sectionStore.get(id);
    }),
  );
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "sectionNode", resourceId: "$id"),
    );
  }
  return node;
}

@Riverpod(keepAlive: true)
RouteSectionFields section(Ref ref, TripId tripId, SectionId id) {
  return ref.watch(sectionNodeProvider(tripId, id).select((s) => s.current));
}

@Riverpod(keepAlive: true)
List<RouteSectionFields> allSections(Ref ref, TripId tripId) {
  final store = ref.watch(routeStoreProvider(tripId));
  return store.sectionStore.store.values.map((s) => s.current).toList();
}

// @riverpod
// bool isSegmentSelected(Ref ref, TripId tripId, SectionId segId) {
//   return ref.watch(
//     mapStateProvider(tripId).select((s) {
//       return switch (s.selection) {
//         MapSegment e => (segId == e.segment.id),
//         _ => false,
//       };
//     }),
//   );
// }
