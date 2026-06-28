import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:media_application/application/services/media_services.dart';
import 'package:media_application/runtime/observable_media_patch_store.dart';
import 'package:media_application/runtime/observable_upload_state_store.dart';
import '/domain/domain.dart';
import 'package:trip_domain/trip_domain.dart';
import "package:uuid/uuid.dart";

class MediaHandler {
  ObservableMediaPatchStore patchStore;
  ObservableMediaStore mediaStore;
  ObservableUploadStateStore uploadStore;
  OptimisticExecutor executor;
  MediaServices mediaServices;
  MediaHandler(
    this.mediaStore,
    this.patchStore,
    this.uploadStore,
    this.executor,
    this.mediaServices,
  );

  Future<Either<Failure, void>> addImage<T>(Id<T> id, File file) async {
    final patch = PatchImageMedia(
      fileKey: FileKey("temp-${const Uuid().v4()}"),
      file: file,
    );
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
      onSuccess: (MediaImage _) => {}, // patchStore.remove(id, patch.fileKey),
      onError: (Failure failure) {
        updateUploadState(UploadStatus.failure, error: failure.message);
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
