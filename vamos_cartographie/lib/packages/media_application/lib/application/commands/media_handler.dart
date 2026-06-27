import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:media_application/application/services/media_services.dart';
import 'package:media_application/runtime/observable_media_patch_store.dart';
import '/domain/domain.dart';
import 'package:trip_domain/trip_domain.dart';
import "package:uuid/uuid.dart";

class MediaHandler {
  ObservableMediaPatchStore patchStore;
  OptimisticExecutor executor;
  MediaServices mediaServices;
  MediaHandler(this.patchStore, this.executor, this.mediaServices);

  Future<Either<Failure, void>> addImage<T>(Id<T> id, File file) async {
    final patch = PatchImageMedia(
      fileKey: ("temp-${const Uuid().v4()}") as FileKey,
      file: file,
    );
    return await executor.run<MediaImage>(
      onApply: () => patchStore.upsert(id, patch),
      remote: () => mediaServices.uploadAndAttach<T>(id, patch.file),
      onSuccess: (MediaImage _) => patchStore.remove(id, patch.fileKey),
      onError: (Failure failure) => patchStore.remove(id, patch.fileKey),
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
