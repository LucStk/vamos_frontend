import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/application/upload_service.dart';
import 'stored_file_store.dart';
import '/domain/domain.dart';

mixin StoredFileEditor on OptimisticRunner<StoredFileStore> {
  StoredFileRepository get storedFileRepo;
  UploadService get uploadService;

  Future<Either<Failure, void>> deleteFile({required StoredFileId id}) async {
    return await run(
      entityKey: id,
      onApply: (gs) => gs,
      remote: (_) => storedFileRepo.detachFile(id),
      onSuccess: (gs, _) => gs.removeMedia(id),
    );
  }

  Future<Failure?> attachFile({
    required Id ownerId,
    required OwnerType ownerType,
    required StoredFileId fileId,
  }) async {
    final res = await storedFileRepo.attachFile(ownerId, ownerType, fileId);
    return res.fold(
      (Failure f) {
        errorLogger?.logError(f, StackTrace.current);
        return f;
      },
      (data) {
        final node = state.get(fileId);
        print("attachFile $node");
        if (node == null) {
          state = state.insertStoredFile(ownerId, data);
        } else {
          state = state.setNode(data);
        }
        return;
      },
    );
  }

  Future<Failure?> uploadFile<T>({
    required Id ownerId,
    required OwnerType ownerType,
    required File file,
  }) async {
    final uploadConf = await uploadService.requestSignedUrl(file);

    return uploadConf.fold(
      (Failure f) {
        errorLogger?.logError(f, StackTrace.current);
        return f;
      },
      (config) async {
        final patch = StoredFilePatchModel(id: config.file.id, file: file);
        state = state.insertStoredFile(ownerId, patch);
        final putRes = await uploadService.putFile(
          file,
          config,
          onProgress: (sent, total) {
            final v = patch.copyWith(sent: sent, total: total);
            state = state.updateNode(
              config.file.id,
              (node) => node.copyWith(current: v),
            );
          },
        );
        if (putRes != null) {
          errorLogger?.logError(putRes);
          return putRes;
        }

        return await attachFile(
          ownerId: ownerId,
          ownerType: ownerType,
          fileId: config.file.id,
        );
      },
    );
  }
}
