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
    return res.fold((Failure f) => f, (data) {
      final node = state.get(fileId);
      if (node == null) {
        state = state.insertStoredFile(ownerId, data);
      } else {
        node.set(data);
      }
      return;
    });
  }

  Future<Either<Failure, UploadConfigModel>> getSignedUrl({
    required Id ownerId,
    required File file,
  }) async {
    final res = await uploadService.requestSignedUrl(file);
    return res.fold(
      (Failure f) {
        errorLogger?.logError(f, StackTrace.current);
        return Left(f);
      },
      (UploadConfigModel data) {
        //On ajoute le storeFilePatch
        state = state.insertStoredFile(
          ownerId,
          StoredFilePatchModel(id: data.file.id, file: file),
        );
        return Right(data);
      },
    );
  }

  Future<Failure?> uploadFile<T>({
    required Id ownerId,
    required OwnerType ownerType,
    required File file,
  }) async {
    final uploadConf = await getSignedUrl(ownerId: ownerId, file: file);
    return uploadConf.fold((Failure f) => f, (config) async {
      final putRes = await uploadService.putFile(
        file,
        config,
        onProgress: (sent, total) {
          print("sent");
          state.updatePatchProgress(config.file.id, sent: sent, total: total);
        },
      );
      if (putRes != null) return putRes;

      await attachFile(
        ownerId: ownerId,
        ownerType: ownerType,
        fileId: config.file.id,
      );
      return null;
    });
  }
}
