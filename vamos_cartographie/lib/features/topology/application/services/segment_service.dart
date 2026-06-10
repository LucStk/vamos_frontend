import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/topology/data/topology_providers.dart';
import 'package:vamos_cartographie/features/topology/data/repositories/segment_repository.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';
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

  Future<Either<Failure, Segment>> updateSegment(
    int id,
    SegmentDraft draft,
  ) async {
    return await _repo.updateSegment(id, draft);
  }

  Future<Either<Failure, void>> deleteSegment(int id) async {
    return await _repo.deleteSegment(id);
  }
}

@riverpod
SegmentService segmentService(Ref ref) {
  return SegmentService(ref.read(segmentRepositoryProvider));
}
