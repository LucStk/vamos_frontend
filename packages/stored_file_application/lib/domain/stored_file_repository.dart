import 'package:dartz/dartz.dart';

import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/domain/stored_file_model.dart';
import 'package:stored_file_application/domain/upload_config_model.dart';

abstract class StoredFileRepository {
  // Future<Either<Failure, StoredFile>> uploadImage(
  //   File file,
  //   Function(int sent, int total)? onProgress,
  // );
  Future<Either<Failure, UploadConfigModel>> getSignedURL(
    String fileName,
    String mimeType,
    int size,
  );
  Future<Either<Failure, void>> detachFile(StoredFileId id);
}
