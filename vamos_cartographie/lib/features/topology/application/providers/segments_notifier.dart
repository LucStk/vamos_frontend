import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/core/state/entity_store_helpers.dart';
import "package:vamos_cartographie/features/topology/application/services/segment_service.dart";
part 'segments_notifier.g.dart';

@riverpod
class SegmentsNotifier extends _$SegmentsNotifier {
  SegmentService get service => ref.read(segmentServiceProvider);
  late final int _tripId;

  Map<int, Segment> get _current => state.value ?? const <int, Segment>{};

  void _emit(Map<int, Segment> next) {
    state = AsyncData(next);
  }

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
    _emit(EntityStoreHelpers.set(_current, segment.id, segment));
  }

  Future<void> updateSegment(int id, SegmentDraft draft) async {
    final previous = _current;

    final existing = previous[id];
    if (existing == null) return;

    final optimistic = existing.copyWith(
      startVertexId: draft.startVertexId,
      endVertexId: draft.endVertexId,
      geometry: existing.geometry,
    );

    _emit(EntityStoreHelpers.update(previous, id, optimistic));

    try {
      final server = await service.updateSegment(id, draft);
      _emit(EntityStoreHelpers.set(_current, server.id, server));
    } catch (_) {
      _emit(previous); // rollback
    }
  }

  Future<void> deleteSegment(int id) async {
    final previous = _current;
    _emit(EntityStoreHelpers.remove(_current, id));
    try {
      await service.deleteSegment(id);
    } catch (_) {
      _emit(previous);
    }
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
