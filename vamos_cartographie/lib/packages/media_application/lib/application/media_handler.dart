import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:media_application/media_application.dart';

import 'package:trip_domain/trip_domain.dart';
import "package:uuid/uuid.dart";

PatchImageMedia generatePatchImage(File file) {
  return PatchImageMedia(
    fileKey: FileKey("temp-${const Uuid().v4()}"),
    file: file,
  );
}

class MediaHandler {
  ObservableMediaPatchStore patchStore;
  ObservableMediaStore mediaStore;
  ObservableUploadStateStore uploadStore;
  OptimisticExecutor executor;
  MediaRepository repository;
  ErrorLogger? errorLogger;

  MediaHandler(
    this.mediaStore,
    this.patchStore,
    this.uploadStore,
    this.executor,
    this.repository,
    this.errorLogger,
  );

  // 1. Premier téléversement (crée le patch avec un nouvel UUID temporaire)
  Future<Either<Failure, void>> uploadPatchImage<T>(
    Id<T> id,
    PatchImageMedia patch,
    MediaOwnerType ownerType,
  ) async {
    void updateUploadState(
      UploadStatus status, {
      int? sent,
      int? total,
      String? error,
    }) {
      uploadStore.upsert(
        patch.fileKey,
        UploadState(status: status, sent: sent, total: total, error: error),
      );
    }

    return await executor.run<MediaImage>(
      onApply: () {
        patchStore.upsert(id, patch);
        updateUploadState(UploadStatus.uploading);
      },
      remote: () => repository.uploadImage(
        patch.file,
        (sent, total) =>
            updateUploadState(UploadStatus.uploading, sent: sent, total: total),
      ),
      onSuccess: (MediaImage _) {
        updateUploadState(UploadStatus.success);
      },
      onError: (Failure failure) {
        updateUploadState(UploadStatus.failure, error: failure.message);
        errorLogger?.logError(failure, StackTrace.current);
      },
    );
  }

  // 2. Nouvelle méthode pour relancer un échec depuis l'UI
  Future<Either<Failure, void>> retryImageUpload<T>(
    Id<T> id,
    FileKey key,
    MediaOwnerType ownerType,
  ) async {
    // Optionnel : On peut nettoyer l'ancien état d'erreur avant de recommencer
    final patch = patchStore.getFor(id)[key];
    if (patch == null) {
      return Left(
        NotFoundFailure(resourceType: "PatchImage", resourceId: "$id - $key"),
      );
    }
    uploadStore.upsert(
      patch.fileKey,
      const UploadState(status: UploadStatus.idle, sent: 0, total: 0),
    );

    return uploadPatchImage(id, patch, ownerType);
  }

  Future<Either<Failure, void>> attachImage<T>(
    Id<T> id,
    PatchImageMedia image,
    MediaOwnerType ownerType,
  ) async {
    final result = await repository.attachImage<T>(
      id,
      image.fileKey,
      ownerType,
    );
    return result.fold((f) => Left(f), (image) {
      patchStore.remove(id, image.fileKey);
      mediaStore.upsert(id, image);
      return Right(null);
    });
  }

  Future<List<Failure>> attachPatchImage<T>(
    Id<T> id,
    MediaOwnerType ownerType,
  ) async {
    final List<Failure> failureList = [];
    for (PatchImageMedia patch in patchStore.getFor(id).values) {
      if (uploadStore.get(patch.fileKey)?.status == UploadStatus.success) {
        final res = await repository.attachImage(id, patch.fileKey, ownerType);
        res.fold((failure) {
          failureList.add(failure);
        }, (_) {});
      }
    }
    return failureList;
  }

  Future<Either<Failure, void>> removeImage<T>(
    Id<T> id,
    FileKey key,
    MediaOwnerType ownerType,
  ) async {
    return await executor.run<void>(
      onApply: () => throw ("not Implemented yet"),
      remote: () => repository.detachImage<T>(id, key, ownerType),
      onSuccess: (_) {},
      onError: (Failure failure) {}, // re-upsert si besoin
    );
  }
}
