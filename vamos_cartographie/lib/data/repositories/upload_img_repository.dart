import 'dart:io';
import 'package:api_client/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/domain/trip_image.dart';

class UploadImgRepository {
  final _dio = Dio();
  final Client _client;

  UploadImgRepository(this._client);

  // ─────────────────────────────────────────────────────────────────────────
  // Upload d'un fichier image
  // ─────────────────────────────────────────────────────────────────────────

  /// Uploade [imageFile] vers le stockage objet et enregistre l'image en DB.
  ///
  /// Retourne un [TripImage] avec `fileKey` et `url` construite par le backend.
  /// [onProgress] est appelé avec (octets envoyés, taille totale).
  Future<Either<Failure, TripImage>> uploadImage(
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
      await _dio.put(
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
      return Right(TripImage(fileKey: fileKey, url: imageUrl));
    } on DioException catch (e) {
      return Left(ServerFailure('Erreur réseau : ${e.message}'));
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Association image → trip
  // ─────────────────────────────────────────────────────────────────────────

  /// Associe une image (identifiée par [fileKey]) à un trip côté serveur.
  ///
  /// À appeler après la création / mise à jour d'un trip pour chaque image
  /// nouvellement ajoutée par l'utilisateur.
  Future<Either<Failure, void>> attachImageToTrip({
    required int tripId,
    required String fileKey,
  }) async {
    try {
      final req = GAttachImageToTripReq(
        vars: GAttachImageToTripVars(tripId: tripId, fileKey: fileKey),
      );
      final response = await _client.request(req).first;
      if (response.hasErrors || response.data == null) {
        return Left(
          ServerFailure(
            response.graphqlErrors?.first.message ??
                'Erreur lors de l\'association de l\'image au trip',
          ),
        );
      }
      return const Right(null);
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }
}
