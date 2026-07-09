import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/core/services/erreur_handler.dart';
import 'package:vamos_cartographie/core/infrastructure/media/media.dart';
import "package:media_application/media_application.dart";
import 'package:path/path.dart' as p;
import 'dart:io';

class MediaRepositoryImpl extends MediaRepository {
  final MediaRemoteDatasource remote;
  final StorageDatasource storage;

  MediaRepositoryImpl({required this.remote, required this.storage});

  @override
  Future<Either<Failure, MediaImage>> uploadImage(
    File file,
    Function(int sent, int total)? onProgress,
  ) {
    return guard(() async {
      final filename = p.basename(file.path);
      final uploadConfig = await remote.getSignedURL(filename);
      await storage.uploadFile(
        url: uploadConfig.uploadUrl,
        data: file.openRead(),
        length: file.lengthSync(),
        contentType: uploadConfig.contentType,
        onProgress: onProgress,
      );
      final saveRes = await remote.createMediaData(uploadConfig.fileKey);
      return MediaImageMappers.fromGQL(saveRes);
    });
  }

  @override
  Future<Either<Failure, MediaImage>> attachImage<T>(
    Id<T> id,
    FileKey filekey,
    MediaOwnerType ownerType,
  ) {
    return guard(() async {
      final res = await remote.attachImageTo(
        id: id,
        fileKey: filekey,
        type: ownerType,
      );
      return MediaImageMappers.fromGQL(res);
    });
  }

  @override
  Future<Either<Failure, void>> detachImage<T>(
    Id<T> id,
    FileKey filekey,
    MediaOwnerType ownerType,
  ) async {
    return guard(() async {
      await remote.deleteImgFrom(id: id, fileKey: filekey, type: ownerType);
    });
  }
}
