import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/backend/core/network/network.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import "media_remote_datasource.dart";
import 'dart:io';

class MediaRepository {
  final MediaRemoteDatasource remote;
  final StorageDatasource storage;

  MediaRepository({required this.remote, required this.storage});

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

      return Right(MediaImage(fileKey: uploadConfig.fileKey, url: saveRes.url));
    } catch (e) {
      return Left(ServerFailure("Upload failde $e"));
    }
  }
}
