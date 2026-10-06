import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import "package:stored_file_application/stored_file_application.dart";
import '../../../core/erreur_handler.dart';
import 'mappers/stored_file_mappers.dart';
import 'mappers/upload_config_mappers.dart';
import 'stored_file_remote_datasource.dart';

class StoredFileRepositoryImpl extends StoredFileRepository {
  final StoredFileRemoteDatasource remote;
  StoredFileRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, UploadConfigModel>> getSignedURL(
    String fileName,
    String mimeType,
    int size,
  ) async {
    return guard(() async {
      final uploadConfig = await remote.getSignedURL(fileName, mimeType, size);
      return uploadConfig.toModel();
    });
  }

  @override
  Future<Either<Failure, StoredFileRemoteModel>> attachFile(
    Id ownerId,
    TargetType ownerType,
    StoredFileId fileId,
  ) {
    return guard(() async {
      final res = await remote.attachFile(ownerId, ownerType, fileId);
      return res.attachFile.toDomain();
    });
  }

  @override
  Future<Either<Failure, void>> detachFile(StoredFileId id) async {
    return guard(() async {
      await remote.deleteFile(id: id);
    });
  }
}
