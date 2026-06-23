import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import 'package:domain_core/id.dart';
import 'package:trip_domain/application/commands/attach_image_to_entity.dart';
import 'package:trip_domain/application/repositories/media_repository.dart';
import 'package:trip_domain/domain/domain.dart';
import 'dart:io';

class MediaServices {
  final MediaRepository repo;
  final AttachImageToEntity _attachImageToEntity;

  MediaServices(this.repo, this._attachImageToEntity);

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

  Future<Either<Failure, MediaImage>> uploadAndAttachToEntity(
    Id id,
    File file,
  ) async {
    try {
      final mediaImage = await uploadMedia(file, "", (_) {});
      await _attachImageToEntity.call(id, mediaImage.fileKey);
      return Right(mediaImage);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }
}
