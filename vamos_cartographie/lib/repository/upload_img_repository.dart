import 'package:dartz/dartz.dart';
import 'package:ferry/ferry.dart';
import 'package:vamos_cartographie/core/failure.dart';
import "package:dio/dio.dart";
import 'dart:io';
import "package:api_client/api_client.dart";

class UploadImgRepository {
  final _dio = Dio();
  final Client _client;
  UploadImgRepository(this._client);

  Future<Either<Failure, String>> uploadImage(
    File imageFile,
    String type, {
    Function(int sent, int total)? onProgress, // Callback de progression
  }) async {
    // On remplace 'jpg' par 'image/jpeg' pour les types MIME valides
    final mimeType = type == 'jpg' ? 'jpeg' : type;
    try {
      // 1. Demander l'URL signée au Backend (Django/Strawberry)
      final request = GGenerateImageUploadUrlReq(
        vars: GGenerateImageUploadUrlVars(extension: mimeType),
      );
      final getUrlRes = await _client.request(request).first;

      if (getUrlRes.hasErrors) return Left(ServerFailure("Erreur signature"));

      final uploadConfig = getUrlRes.data?.generateImageUploadUrl;
      final String signedUrl = uploadConfig!.uploadUrl; // L'URL vers Garage
      final String fileKey =
          uploadConfig.fileKey; // Le chemin relatif à stocker en DB
      print("signedUrl: $signedUrl, fileKey: $fileKey");
      // 2. Upload avec suivi de progression
      await _dio.put(
        signedUrl,
        data: imageFile.openRead(),
        options: Options(
          headers: {
            "Content-Type": "image/$mimeType",
            "Content-Length": imageFile.lengthSync(),
          },
        ),
        // C'est ici que la magie opère :
        onSendProgress: (int sent, int total) {
          if (onProgress != null) {
            onProgress(sent, total);
          }
        },
      );

      return Right(fileKey);
    } on DioException catch (e) {
      return Left(ConnectionFailure());
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }
}
