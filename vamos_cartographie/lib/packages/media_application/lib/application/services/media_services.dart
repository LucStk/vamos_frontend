import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/application/repositories/attachable_media_repository.dart';
import 'package:trip_domain/application/repositories/media_repository.dart';
import 'package:trip_domain/domain/domain.dart';
import 'dart:io';

import 'package:trip_domain/runtime/store/media_store.dart';

class MediaServices {
  final MediaRepository repo;
  final AttachableMediaRepository attachRepo;
  final MediaStore store;

  MediaServices(this.repo, this.attachRepo, this.store);

  Future<MediaImage> uploadMedia(
    File file,
    String type,
    Function(int sent, int total) onProgress,
  ) async {
    final result = await repo.uploadImage(file, type, onProgress);
    return result.fold((f) => throw Exception(f.message), (m) => m);
  }

  Future<Either<Failure, MediaImage>> uploadAndAttach(Id id, File file) async {
    try {
      final mediaImage = await uploadMedia(file, "", (_) {});
      final result = await attachRepo.attachImage(id, mediaImage.fileKey);
      return result.fold((f) => Left(f), (image) {
        store.upsert(id, image);
        return Right(image);
      });
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Either<Failure, void>> detachFromEntity(Id id, FileKey key) async {
    try {
      final result = await attachRepo.detachImage(id, key);
      return result.fold((f) => Left(f), (_) {
        store.remove(id, key);
        return const Right(null);
      });
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }
}
