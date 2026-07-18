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

  Future<Either<Failure, UploadConfigModel>> uploadFile<T>({
    required Id<T> ownerId,
    required File file,
  }) async {
    final signedRes = await uploadService.requestSignedUrl(file);

    return await signedRes.fold(
      (failure) => Left(
        failure,
      ), // rien à insérer, rien à rollback : pas de state touché
      (config) async {
        final patch = StoredFilePatchModel(id: config.file.id, file: file);

        return await run(
          entityKey: config.file.id,
          onApply: (gs) => gs.insertStoredFile(ownerId, patch),
          remote: (reportProgress) async {
            final putRes = await uploadService.putFile(
              file,
              config,
              onProgress: (sent, total) {
                reportProgress(
                  (gs) => gs
                    ..updatePatchProgress(
                      config.file.id,
                      sent: sent,
                      total: total,
                    ),
                );
              },
            );
            return putRes.fold((f) => Left(f), (_) => Right(config));
          },
          onSuccess: (gs, config) => gs..markUploaded(config.file),
          onError: (gs, f) => gs..markFailed(config.file.id, f),
        );
      },
    );
  }
}
