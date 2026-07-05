import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:media_application/media_application.dart';

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

  MediaHandler(
    this.mediaStore,
    this.patchStore,
    this.uploadStore,
    this.executor,
    this.repository,
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
      FileKey? resolvedFileKey,
    }) {
      uploadStore.upsert(
        patch.fileKey,
        UploadState(
          status: status,
          sent: sent,
          total: total,
          error: error,
          resolvedFileKey: resolvedFileKey,
        ),
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
      onSuccess: (MediaImage image) {
        updateUploadState(
          UploadStatus.success,
          resolvedFileKey: image.fileKey, // ✅ on stocke le vrai fileKey
        );
      },
      onError: (Failure failure) =>
          updateUploadState(UploadStatus.failure, error: failure.message),
    );
  }

  Future<List<Failure>> attachPatchImage<T>(
    Id<T> id,
    MediaOwnerType ownerType,
  ) async {
    final List<Failure> failureList = [];

    // Snapshot de la map avant l'itération
    final patches = List<PatchImageMedia>.from(patchStore.getFor(id).values);

    for (PatchImageMedia patch in patches) {
      final uploadState = uploadStore.get(patch.fileKey);
      final resolvedFileKey = uploadState?.resolvedFileKey;
      if (uploadState?.status == UploadStatus.success &&
          resolvedFileKey != null) {
        await executor.run(
          onApply: () {},
          remote: () => repository.attachImage(id, resolvedFileKey, ownerType),
          onSuccess: (image) {
            patchStore.remove(id, patch.fileKey);
            mediaStore.upsert(id, image);
          },
          onError: (Failure failure) {
            failureList.add(failure);
          },
        );
      }
    }
    return failureList;
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
      final failure = NotFoundFailure(
        resourceType: "PatchImage",
        resourceId: "$id - $key",
      );

      return Left(failure);
    }
    uploadStore.upsert(
      patch.fileKey,
      const UploadState(status: UploadStatus.idle, sent: 0, total: 0),
    );

    return uploadPatchImage(id, patch, ownerType);
  }

  Future<Either<Failure, void>> removeImage<T>(
    Id<T> id,
    ImageUiModel imageUi,
    MediaOwnerType ownerType,
  ) async {
    switch (imageUi.imageLocation) {
      case LocalPath():
        patchStore.remove(id, imageUi.fileKey);
      case RemoteUrl():
        return await executor.run(
          onApply: () {},
          remote: () =>
              repository.detachImage<T>(id, imageUi.fileKey, ownerType),
          onSuccess: (data) => mediaStore.remove(id, imageUi.fileKey),
          onError: (Failure failure) {},
        );
    }

    return Right(null);
  }
}
