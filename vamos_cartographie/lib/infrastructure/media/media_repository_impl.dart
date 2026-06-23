import 'package:dartz/dartz.dart';
import 'package:trip_domain/application/repositories/media_repository.dart';
import 'package:trip_domain/domain/entities/media_image.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/infrastructure/media/mappers/media_image_mappers.dart';
import 'package:vamos_cartographie/infrastructure/media/mappers/owner_type_mappers.dart';
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

  @override
  Future<Either<Failure, MediaImage>> attachImage<T>(
    Id<T> id,
    FileKey filekey,
  ) async {
    try {
      final res = await remote.attachImageTo(
        id: id,
        fileKey: filekey,
        type: ownerType(T),
      );
      return Right(MediaImageMappers.fromGQL(res));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> detachImage<T>(
    Id<T> id,
    FileKey filekey,
  ) async {
    try {
      await remote.deleteImgFrom(id: id, fileKey: filekey, type: ownerType(T));
      return Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }
}
