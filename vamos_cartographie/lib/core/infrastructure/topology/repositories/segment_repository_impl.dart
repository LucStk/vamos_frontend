import 'package:dartz/dartz.dart';
import 'package:trip_domain/trip_domain.dart';

import 'package:domain_core/domain_core.dart';
import '/core/infrastructure/topology/mappers/segment_mappers.dart';
import 'package:vamos_cartographie/core/infrastructure/topology/topology.dart';

class SegmentRepositoryImpl extends SegmentRepository {
  final SegmentRemoteDatasource remote;

  SegmentRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<Segment>>> getSegments(Id<Trip> tripId) async {
    try {
      final segments = await remote.getSegments(tripId: tripId);
      final ret = segments.map(SegmentMapper.fromGQL).toList();
      return Right(ret);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  // Future<Either<Failure, Segment>> createSegment(
  //   Id<Trip> tripId,
  //   SegmentDraft segment,
  // ) async {
  //   try {
  //     final input = SegmentDraftMapper.toGQLInput(segment);
  //     final gqlResult = await remote.createSegment(
  //       tripId: tripId,
  //       input: input,
  //     );
  //     final createSegment = SegmentMapper.fromGQL(gqlResult);
  //     return Right(createSegment);
  //   } on Exception catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   } catch (_) {
  //     return Left(const ConnectionFailure());
  //   }
  // }

  @override
  Future<Either<Failure, Segment>> updateSegment(Segment segment) async {
    try {
      final input = SegmentMapper.toGQLUpdateInput(segment);
      final gqlResult = await remote.updateSegment(
        id: segment.id,
        input: input,
      );
      final updatedSegment = SegmentMapper.fromGQL(gqlResult);

      return Right(updatedSegment);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteSegment(Id<Segment> id) async {
    try {
      await remote.deleteSegment(id: id);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }
}
