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

  Future<Either<Failure, StoredFileRemoteModel>> uploadFile<T>({
    required Id<T> ownerId,
    required OwnerType ownerType,
    required File file,
  }) async {
    final signedRes = await uploadService.requestSignedUrl(file);

    return await signedRes.fold(
      (failure) => Left(
        failure,
      ), // rien à insérer, rien à rollback : pas de state touché
      (config) async {
        final fileId = config.file.id;
        final patch = StoredFilePatchModel(id: fileId, file: file);

        return await run(
          entityKey: fileId,
          onApply: (gs) => gs.insertStoredFile(ownerId, patch),
          remote: (reportProgress) async {
            final putRes = await uploadService.putFile(
              file,
              config,
              onProgress: (sent, total) {
                reportProgress(
                  (gs) =>
                      gs..updatePatchProgress(fileId, sent: sent, total: total),
                );
              },
            );
            return putRes.fold((f) => Left(f), (data) async {
              final attachRes = await storedFileRepo.attachFile(
                ownerId,
                ownerType,
                fileId,
              );
              return attachRes.fold((f) => Left(f), (data) => Right(data));
            });
          },
          onSuccess: (gs, data) => gs..markUploaded(data),
          onError: (gs, f) => gs..markFailed(fileId, f),
        );
      },
    );
  }
}
