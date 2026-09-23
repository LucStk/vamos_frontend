import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import "graphql/graphql.dart";
import "mappers/mappers.dart";
import 'package:vamos_cartographie/core/network/network.dart';
import 'package:ferry/ferry.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le ferryClient Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class StoredFileRemoteDatasource {
  final Client ferryClient;

  StoredFileRemoteDatasource(this.ferryClient);

  Future<GAttachFileData> attachFile(
    Id ownerId,
    TargetType ownerType,
    StoredFileId fileId,
  ) async {
    final data = await ferryClient.execute(
      GAttachFileReq(
        vars: GAttachFileVars(
          input: GAttachFileInput(
            targetId: ownerId.value,
            targetType: ownerType.toGql(),
            fileId: fileId.value,
          ),
        ),
      ),
    );
    return data;
  }

  Future<GUploadConfigFields> getSignedURL(
    String filename,
    String mimeType,
    int size,
  ) async {
    // 1. Demander l'URL signée au backend
    final data = await ferryClient.execute(
      GGenerateImageUploadUrlReq(
        vars: GGenerateImageUploadUrlVars(
          input: GImageUploadRequest(
            filename: filename,
            mimeType: mimeType,
            size: size,
          ),
        ),
      ),
    );

    return data.generateImageUploadUrl;
  }

  Future<void> deleteFile({required Id id}) async {
    await ferryClient.execute(
      GDetachFileReq(vars: GDetachFileVars(id: id.value)),
    );
  }
}
