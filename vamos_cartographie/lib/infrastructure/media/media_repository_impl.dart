import 'package:dartz/dartz.dart';
import 'package:trip_domain/application/repositories/media_repository.dart';
import 'package:trip_domain/domain/media_image.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/infrastructure/media/storage_datasource.dart';
import "media_remote_datasource.dart";
import 'dart:io';

class MediaRepositoryImpl extends MediaRepository {
  final MediaRemoteDatasource remote;
  final StorageDatasource storage;

  MediaRepositoryImpl({required this.remote, required this.storage});
  @override
  Future<Either<Failure, MediaImage>> uploadImage(
    File imageFile,
    String type,
    Function(int sent, int total)? onProgress,
  ) async {
    try {
      final mimeType = type == 'jpg' ? 'jpeg' : type;
      final uploadConfig = await remote.getSignedURL(mimeType);
      await storage.uploadFile(
        url: uploadConfig.uploadUrl,
        data: imageFile.openRead(),
        length: imageFile.lengthSync(),
        contentType: 'image/$mimeType',
        onProgress: onProgress,
      );
      final saveRes = await remote.createMediaData(uploadConfig.fileKey);
      return Right(
        MediaImage(
          fileKey: uploadConfig.fileKey as FileKey,
          url: saveRes.url as Url,
        ),
      );
    } catch (e) {
      return Left(ServerFailure("Upload failde $e"));
    }
  }
}
