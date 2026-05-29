import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/waypoints/data/datasources/waypoint_remote_datasource.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/mappers.dart';
import 'package:vamos_cartographie/features/media/data/repositories/upload_img_repository.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';
import 'i_waypoint_repository.dart';

class WaypointRepository implements IWaypointRepository {
  final WaypointRemoteDatasource remote;
  final UploadImgRepository imageRepo;

  WaypointRepository(this.remote, this.imageRepo);

  @override
  Future<Either<Failure, Waypoint>> updateWaypoint(
    int id,
    WaypointDraft waypoint,
  ) async {
    try {
      final input = WaypointDraftMapper.toGQLUpdateInput(waypoint);
      final gqlResult = await remote.updateWaypoint(id: id, input: input);
      final updatedWaypoint = WaypointMapper.fromGQL(gqlResult);

      return Right(updatedWaypoint);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }
}
