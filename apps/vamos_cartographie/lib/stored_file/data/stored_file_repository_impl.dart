import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/core/services/erreur_handler.dart';
import "package:stored_file_application/stored_file_application.dart";
import 'package:vamos_cartographie/stored_file/data/stored_file_remote_datasource.dart';

class StoredFileRepositoryImpl extends StoredFileRepository {
  final StoredFileRemoteDatasource remote;
  StoredFileRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, String>> getSignedURL(
    String fileName,
    String mimeType,
    int size,
  ) {
    return guard(() async {
      final uploadConfig = await remote.getSignedURL(fileName, mimeType, size);
      return uploadConfig.uploadUrl;
    });
  }

  @override
  Future<Either<Failure, void>> detachFile(StoredFileId id) async {
    return guard(() async {
      await remote.deleteFile(id: id);
    });
  }
}
