import 'package:domain_core/domain_core.dart';
import '/media/data/mappers/mappers.dart';
import "/media/data/graphql/graphql.dart";
import 'package:vamos_cartographie/core/network/network.dart';
import 'package:ferry/ferry.dart';

import "package:media_application/media_application.dart";

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le ferryClient Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class MediaRemoteDatasource {
  final Client ferryClient;

  MediaRemoteDatasource(this.ferryClient);

  Future<GGenerateImageUploadUrlData_generateImageUploadUrl> getSignedURL(
    String filename,
  ) async {
    // 1. Demander l'URL signée au backend
    final data = await ferryClient.execute(
      GGenerateImageUploadUrlReq(
        vars: GGenerateImageUploadUrlVars(filename: filename),
      ),
    );

    return data.generateImageUploadUrl;
  }

  Future<GImageFieldsData> createMediaData(String fileKey) async {
    // Créer un objet media dans la db
    final data = await ferryClient.execute(
      GCreateImageReq(vars: GCreateImageVars(fileKey: fileKey)),
    );
    return data.createImage;
  }

  Future<GImageFieldsData> attachImageTo({
    required Id id,
    required FileKey fileKey,
    required MediaOwnerType type,
  }) async {
    final data = await ferryClient.execute(
      GAttachImageToReq(
        vars: GAttachImageToVars(
          id: id.value,
          fileKey: fileKey.value,
          type: type.toGQL(),
        ),
      ),
    );

    return data.attachImageTo.image;
  }

  Future<void> deleteImgFrom({
    required Id id,
    required FileKey fileKey,
    required MediaOwnerType type,
  }) async {
    await ferryClient.execute(
      GDeleteImageFromReq(
        vars: GDeleteImageFromVars(
          id: id.value,
          fileKey: fileKey.value,
          type: type.toGQL(),
        ),
      ),
    );
  }
}
