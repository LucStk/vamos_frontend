import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/core/state/entity_store_helpers.dart';

part 'segments_notifier.g.dart';

@riverpod
class SegmentsNotifier extends _$SegmentsNotifier {
  SegmentRepository get repository => ref.read(segmentRepositoryProvider);

  late final int _tripId;

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  Map<int, Segment> get _current => state.value ?? const <int, Segment>{};

  void _emit(Map<int, Segment> next) {
    state = AsyncData(next);
  }

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  @override
  Future<Map<int, Segment>> build(int tripId) async {
    _tripId = tripId;
    return _load();
  }

  Future<Map<int, Segment>> _load() async {
    final result = await repository.getSegments(_tripId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (segments) => {for (final segment in segments) segment.id: segment},
    );
  }

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() => _load());
  }

  Future<void> createSegment(SegmentDraft draft) async {
    final result = await repository.createSegment(_tripId, draft);

    result.fold((_) {}, (segment) {
      _emit(EntityStoreHelpers.set(_current, segment.id, segment));
    });
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

    final result = await repository.updateSegment(id, draft);

    result.fold(
      (_) {
        _emit(previous);
      },
      (serverSegment) {
        _emit(
          EntityStoreHelpers.set(_current, serverSegment.id, serverSegment),
        );
      },
    );
  }

  Future<void> deleteSegment(int id) async {
    final previous = _current;

    _emit(EntityStoreHelpers.remove(_current, id));

    final result = await repository.deleteSegment(id);

    result.fold((_) => _emit(previous), (_) {});
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
