import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:ferry/ferry.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le client Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class MediaRemoteDatasource {
  final Client client;

  MediaRemoteDatasource(this.client);

  Future<GGenerateImageUploadUrlData_generateImageUploadUrl> getSignedURL(
    String type,
  ) async {
    // 1. Demander l'URL signée au backend
    final signReq = GGenerateImageUploadUrlReq(
      vars: GGenerateImageUploadUrlVars(extension: type),
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
    final saveReq = GCreateImageReq(vars: GCreateImageVars(fileKey: fileKey));
    final response = await client.request(saveReq).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ?? "Erreur lors de l'uploadMedia",
      );
    }
    return response.data!.createImage;
  }
}
