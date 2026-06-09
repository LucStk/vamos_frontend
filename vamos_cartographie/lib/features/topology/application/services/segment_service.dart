import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/topology/data/topology_providers.dart';
import 'package:vamos_cartographie/features/topology/data/repositories/segment_repository.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
part "segment_service.g.dart";

class SegmentService {
  final SegmentRepository _repo;
  SegmentService(this._repo);

  Future<Map<int, Segment>> getSegments(int tripId) async {
    final result = await _repo.getSegments(tripId);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (segments) => {for (final segment in segments) segment.id: segment},
    );
  }

  Future<Segment> createSegment(int tripId, SegmentDraft draft) async {
    final result = await _repo.createSegment(tripId, draft);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (segment) => segment,
    );
  }

  Future<Segment> updateSegment(int id, SegmentDraft draft) async {
    final result = await _repo.updateSegment(id, draft);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (segment) => segment,
    );
  }

  Future<void> deleteSegment(int id) async {
    final result = await _repo.deleteSegment(id);

    return result.fold((failure) => throw Exception(failure.message), (_) {});
  }
}

@riverpod
SegmentService segmentService(Ref ref) {
  return SegmentService(ref.read(segmentRepositoryProvider));
}
