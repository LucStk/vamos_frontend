import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/state/optimistic.dart';
import 'package:vamos_cartographie/core/state/state.dart';

import 'package:vamos_cartographie/features/topology/topology.dart';
import "package:vamos_cartographie/features/topology/application/services/segment_service.dart";
part 'segments_notifier.g.dart';

@riverpod
class SegmentsNotifier extends _$SegmentsNotifier with EntityNotifier<Segment> {
  SegmentService get service => ref.read(segmentServiceProvider);
  late final int _tripId;

  @override
  Future<Map<int, Segment>> build(int tripId) async {
    _tripId = tripId;
    return await service.getSegments(_tripId);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => await service.getSegments(_tripId),
    );
  }

  Future<void> createSegment(SegmentDraft draft) async {
    final segment = await service.createSegment(_tripId, draft);
    upsertLocal(segment);
  }

  Future<void> updateSegment(int id, SegmentDraft draft) async {
    final old = getOrThrow(id);
    await optimistic(
      spec: OptimisticSpec(
        apply: () => updateLocal(draft.toSegment(id)),
        rollback: () => updateLocal(old),
        reconcile: upsertLocal,
      ),
      remote: () => service.updateSegment(id, draft),
    );
  }

  Future<void> deleteSegment(int id) async {
    final old = getOrThrow(id);
    await optimistic(
      spec: OptimisticSpec(
        apply: () => removeLocal(id),
        rollback: () => upsertLocal(old),
      ),
      remote: () => service.deleteSegment(id),
    );
  }
}

@riverpod
Map<int, Segment> segmentMap(Ref ref, int tripId) {
  return ref.watch(segmentsProvider(tripId)).value ?? const {};
}

@riverpod
List<int> segmentIds(Ref ref, int tripId) {
  return ref.watch(
    segmentMapProvider(tripId).select((map) => map.keys.toList()),
  );
}

@riverpod
Segment? segmentById(Ref ref, int tripId, int segmentId) {
  return ref.watch(segmentMapProvider(tripId).select((map) => map[segmentId]));
}
