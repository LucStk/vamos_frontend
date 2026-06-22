import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import 'package:trip_domain/application/commands/attach_image_to_trip.dart';
import 'package:trip_domain/application/commands/attach_image_to_waypoint.dart';
import 'package:trip_domain/application/repositories/media_repository.dart';
import 'package:trip_domain/domain/media_image.dart';
import 'dart:io';

import 'package:trip_domain/domain/trip.dart';
import 'package:trip_domain/domain/waypoint.dart';

class MediaServices {
  final MediaRepository repo;
  final AttachImageToTrip _attachImageToTrip;
  final AttachImageToWaypoint _attachImageToWaypoint;

  MediaServices(
    this.repo,
    this._attachImageToTrip,
    this._attachImageToWaypoint,
  );

  Future<MediaImage> uploadMedia(
    File file,
    String type,
    Function(double progress) onProgressCallback, //affiche le progrés
  ) async {
    onProgress(sent, total) {
      final double progress = total > 0 ? sent / total : 0;
      onProgressCallback(progress);
    }

    final result = await repo.uploadImage(file, type, onProgress);
    return result.fold((f) => throw Exception(f.message), (m) => m);
  }

  Future<Either<Failure, MediaImage>> uploadAndAttachToTrip(
    File file,
    TripId tripId,
  ) async {
    try {
      final mediaImage = await uploadMedia(file, "", (_) {});
      await _attachImageToTrip.call(tripId, mediaImage.fileKey);
      return Right(mediaImage);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Either<Failure, MediaImage>> uploadAndAttachToWaypoint(
    File file,
    WaypointId id,
  ) async {
    try {
      final mediaImage = await uploadMedia(file, "", (_) {});
      await _attachImageToWaypoint.call(id, mediaImage.fileKey);
      return Right(mediaImage);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }
}
