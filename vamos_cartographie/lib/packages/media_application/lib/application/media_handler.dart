import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import './media_services.dart';
import '/runtime/observable_media_patch_store.dart';
import '/runtime/observable_upload_state_store.dart';
import '/domain/domain.dart';
import 'package:trip_domain/trip_domain.dart';
import "package:uuid/uuid.dart";

class MediaHandler {
  ObservableMediaPatchStore patchStore;
  ObservableMediaStore mediaStore;
  ObservableUploadStateStore uploadStore;
  OptimisticExecutor executor;
  MediaServices mediaServices;
  ErrorLogger? errorLogger;

  MediaHandler(
    this.mediaStore,
    this.patchStore,
    this.uploadStore,
    this.executor,
    this.mediaServices,
    this.errorLogger,
  );

  // 1. Premier téléversement (crée le patch avec un nouvel UUID temporaire)
  Future<Either<Failure, void>> uploadImage<T>(Id<T> id, File file) async {
    final patch = PatchImageMedia(
      fileKey: FileKey("temp-${const Uuid().v4()}"),
      file: file,
    );
    return addImage(id, patch);
  }

  // 2. Nouvelle méthode pour relancer un échec depuis l'UI
  Future<Either<Failure, void>> retryImageUpload<T>(
    Id<T> id,
    FileKey key,
  ) async {
    // Optionnel : On peut nettoyer l'ancien état d'erreur avant de recommencer
    final patch = patchStore.get(id)[key];
    if (patch == null) {
      return Left(
        NotFoundFailure(resourceType: "PatchImage", resourceId: "$id - $key"),
      );
    }
    uploadStore.upsert(
      patch.fileKey,
      const UploadState(status: UploadStatus.idle, sent: 0, total: 0),
    );

    return addImage(id, patch);
  }

  Future<Either<Failure, void>> addImage<T>(
    Id<T> id,
    PatchImageMedia patch,
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
      remote: () => mediaServices.uploadAndAttach<T>(
        id,
        patch.file,
        (sent, total) =>
            updateUploadState(UploadStatus.uploading, sent: sent, total: total),
      ),
      onSuccess: (MediaImage _) {
        // C'est ici qu'on nettoie le store une fois que c'est un succès en base
        // patchStore.remove(id, patch.fileKey);
        // updateUploadState(UploadStatus.success);
      },
      onError: (Failure failure) {
        updateUploadState(UploadStatus.failure, error: failure.message);
        errorLogger?.logError(failure, StackTrace.current);
      },
    );
  }

  Future<Either<Failure, void>> removeImage<T>(Id<T> id, FileKey key) async {
    return await executor.run<void>(
      onApply: () => throw ("not Implemented yet"),
      remote: () => mediaServices.detachFromEntity<T>(id, key),
      onSuccess: (_) {},
      onError: (Failure failure) {}, // re-upsert si besoin
    );
  }
}
