import 'dart:io';
import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'upload_img_repository.g.dart';

final dio = Dio();

class UploadImgRepository {
  final Client _client;

  UploadImgRepository(this._client);

  // ─────────────────────────────────────────────────────────────────────────
  // Upload d'un fichier image
  // ─────────────────────────────────────────────────────────────────────────

  /// Uploade [imageFile] vers le stockage objet et enregistre l'image en DB.
  ///
  /// Retourne un [MediaImage] avec `fileKey` et `url` construite par le backend.
  /// [onProgress] est appelé avec (octets envoyés, taille totale).
  Future<Either<Failure, MediaImage>> uploadImage(
    File imageFile,
    String type, {
    Function(int sent, int total)? onProgress,
  }) async {
    final mimeType = type == 'jpg' ? 'jpeg' : type;
    try {
      // 1. Demander l'URL signée au backend
      final signReq = GGenerateImageUploadUrlReq(
        vars: GGenerateImageUploadUrlVars(extension: mimeType),
      );
      final signRes = await _client.request(signReq).first;
      if (signRes.hasErrors || signRes.data == null) {
        return Left(ServerFailure('Erreur lors de la signature de l\'upload'));
      }

      final uploadConfig = signRes.data!.generateImageUploadUrl;
      final signedUrl = uploadConfig.uploadUrl;
      final fileKey = uploadConfig.fileKey;

      // 2. Upload vers le stockage objet
      await dio.put(
        signedUrl,
        data: imageFile.openRead(),
        options: Options(
          headers: {
            'Content-Type': 'image/$mimeType',
            'Content-Length': imageFile.lengthSync(),
          },
        ),
        onSendProgress: (sent, total) => onProgress?.call(sent, total),
      );

      // 3. Créer l'enregistrement image en DB
      final saveReq = GCreateImageReq(vars: GCreateImageVars(fileKey: fileKey));
      final saveRes = await _client.request(saveReq).first;
      if (saveRes.hasErrors || saveRes.data == null) {
        return Left(
          ServerFailure('Erreur lors de l\'enregistrement de l\'image'),
        );
      }

      final imageUrl = saveRes.data!.createImage.url;
      return Right(MediaImage(fileKey: fileKey, url: imageUrl));
    } on DioException catch (e) {
      return Left(ServerFailure('Erreur réseau : ${e.message}'));
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }
}

@riverpod
UploadImgRepository uploadImgRepository(Ref ref) {
  // 2. On récupère directement l'instance configurée dans GetIt.
  // Que ce soit le vrai Repository ou le Mock, GetIt donnera la bonne version.
  return GetIt.instance<UploadImgRepository>();
}
