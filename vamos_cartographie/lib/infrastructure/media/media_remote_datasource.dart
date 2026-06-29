import 'package:domain_core/domain_core.dart';
import 'package:flutter/rendering.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:ferry/ferry.dart';
import 'package:vamos_cartographie/infrastructure/media/mappers/owner_type_mappers.dart';
import "package:media_application/media_application.dart";

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le client Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class MediaRemoteDatasource {
  final Client client;

  MediaRemoteDatasource(this.client);

  Future<GGenerateImageUploadUrlData_generateImageUploadUrl> getSignedURL(
    String filename,
  ) async {
    // 1. Demander l'URL signée au backend
    final signReq = GGenerateImageUploadUrlReq(
      vars: GGenerateImageUploadUrlVars(filename: filename),
    );
    final response = await client.request(signReq).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la signature de l\'upload',
      );
    }
    return response.data!.generateImageUploadUrl;
  }

  Future<GImageFieldsData> createMediaData(String fileKey) async {
    // Créer un objet media dans la db
    final saveReq = GCreateImageReq(vars: GCreateImageVars(fileKey: fileKey));
    final response = await client.request(saveReq).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ?? "Erreur lors de l'uploadMedia",
      );
    }
    return response.data!.createImage;
  }

  Future<GImageFieldsData> attachImageTo({
    required Id id,
    required FileKey fileKey,
    required MediaOwnerType type,
  }) async {
    final req = GAttachImageToReq(
      vars: GAttachImageToVars(
        id: id.value,
        fileKey: fileKey.value,
        type: type.toGQL(),
      ),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de l\'association de l\'image au trip',
      );
    }
    return response.data!.attachImageTo.image;
  }

  Future<void> deleteImgFrom({
    required Id id,
    required FileKey fileKey,
    required MediaOwnerType type,
  }) async {
    final req = GDeleteImageFromReq(
      vars: GDeleteImageFromVars(
        id: id.value,
        fileKey: fileKey.value,
        type: type.toGQL(),
      ),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            "Erreur lors de la suppression de l'image trip",
      );
    }
  }
}
