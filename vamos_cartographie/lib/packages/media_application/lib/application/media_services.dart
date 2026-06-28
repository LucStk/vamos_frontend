import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:media_application/domain/value_objects/media_owner_ext.dart';
import 'media_repository.dart';
import 'package:trip_domain/domain/domain.dart';
import 'dart:io';

import 'package:trip_domain/runtime/store/media_store.dart';

class MediaServices {
  final MediaRepository repo;
  final MediaStore store;

  MediaServices(this.repo, this.store);

  Future<Either<Failure, MediaImage>> uploadAndAttach<T>(
    Id<T> id,
    File file,
    MediaOwnerType ownerType,
    Function(int sent, int total)? onProgress,
  ) async {
    final resUpload = await repo.uploadImage(file, onProgress);

    if (resUpload.isLeft()) return resUpload;

    final image = resUpload.getOrElse(() => throw Exception());
    final result = await repo.attachImage<T>(id, image.fileKey, ownerType);

    return result.fold((f) => Left(f), (image) {
      store.upsert(id, image);
      return Right(image);
    });
  }

  Future<Either<Failure, void>> detachFromEntity<T>(
    Id<T> id,
    FileKey key,
    MediaOwnerType ownerType,
  ) async {
    final result = await repo.detachImage<T>(id, key, ownerType);
    return result.fold((f) => Left(f), (_) {
      store.remove(id, key);
      return const Right(null);
    });
  }
}
