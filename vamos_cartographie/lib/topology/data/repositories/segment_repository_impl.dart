import 'package:dartz/dartz.dart';
import 'package:trip_domain/trip_domain.dart';

import 'package:vamos_cartographie/core/services/erreur_handler.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/topology/data/datasources/segment_remote_datasource.dart';
import 'package:vamos_cartographie/topology/data/mappers/mappers.dart';

class SegmentRepositoryImpl extends SegmentRepository {
  final SegmentRemoteDatasource remote;

  SegmentRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<Segment>>> getSegments(Id<Trip> tripId) {
    return guard(() async {
      final segments = await remote.getSegments(tripId: tripId);
      return segments.map(SegmentMapper.fromGQL).toList();
    });
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
    return guard(() async {
      final input = SegmentMapper.toGQLUpdateInput(segment);
      final gqlResult = await remote.updateSegment(
        id: segment.id,
        input: input,
      );
      return SegmentMapper.fromGQL(gqlResult);
    });
  }

  @override
  Future<Either<Failure, void>> deleteSegment(Id<Segment> id) async {
    return guard(() async {
      await remote.deleteSegment(id: id);
    });
  }
}
