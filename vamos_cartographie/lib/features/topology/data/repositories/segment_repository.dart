import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/topology/data/datasources/segment_remote_datasource.dart';
import 'package:vamos_cartographie/features/topology/data/mappers/mappers.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';

class SegmentRepository {
  final SegmentRemoteDatasource remote;

  SegmentRepository(this.remote);

  Future<Either<Failure, List<Segment>>> getSegments(int tripId) async {
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

  Future<Either<Failure, Segment>> createSegment(
    int tripId,
    SegmentDraft segment,
  ) async {
    try {
      final input = SegmentDraftMapper.toGQLInput(segment);
      final gqlResult = await remote.createSegment(
        tripId: tripId,
        input: input,
      );
      final createSegment = SegmentMapper.fromGQL(gqlResult);
      return Right(createSegment);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Either<Failure, Segment>> updateSegment(
    int id,
    SegmentDraft segment,
  ) async {
    try {
      final input = SegmentDraftMapper.toGQLUpdateInput(segment);
      final gqlResult = await remote.updateSegment(id: id, input: input);
      final updatedSegment = SegmentMapper.fromGQL(gqlResult);

      return Right(updatedSegment);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Either<Failure, void>> deleteSegment(int id) async {
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
