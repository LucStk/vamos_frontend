import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';

import "package:vamos_cartographie/backend/core/fake_graphql_store.dart";
import "package:vamos_cartographie/backend/mapping/gql_mappers.dart";

/// Résout les opérations GraphQL relatives aux médias.
class MediaResolver {
  final FakeGraphQLStore store;

  /// URL de base utilisée pour les pre-signed URLs fictives.
  static const _fakeUploadBase = 'https://fake-storage.example.com/upload';

  /// Table de correspondance qui associe chaque nom d'opération GraphQL
  /// à sa fonction de traitement (désérialisation -> exécution -> JSON).
  late final Map<String, Map<String, dynamic>? Function(Map<String, dynamic>?)>
  mockHandlers;

  MediaResolver(this.store) {
    _initHandlers();
  }

  void _initHandlers() {
    mockHandlers = {
      // Mutations
      "GenerateImageUploadUrl": (raw) => generateImageUploadUrl(
        GGenerateImageUploadUrlVars.fromJson(raw ?? const {}),
      ).toJson(),
      "CreateImage": (raw) =>
          createImage(GCreateImageVars.fromJson(raw ?? const {})).toJson(),
    };
  }

  /// Génère une URL d'upload fictive et enregistre le futur [CarouselItem]
  /// dans le store avec le statut [UploadStatus.idle].
  ///
  /// Dans le fake, l'upload réel est simulé (aucun fichier n'est transféré).
  /// L'image devient disponible côté store lors de l'appel à [createImage].
  GGenerateImageUploadUrlData generateImageUploadUrl(
    GGenerateImageUploadUrlVars vars,
  ) {
    final String extension = vars.extension;
    final fileKey = 'fake_${DateTime.now().microsecondsSinceEpoch}';
    final uploadUrl = '$_fakeUploadBase/$fileKey.$extension';

    return GGenerateImageUploadUrlData(
      generateImageUploadUrl:
          GGenerateImageUploadUrlData_generateImageUploadUrl(
            fileKey: fileKey,
            uploadUrl: uploadUrl,
          ),
    );
  }

  /// Marque l'image [fileKey] comme distante (upload terminé) dans le store.
  ///
  /// Si la clé n'existe pas encore dans le store, elle est créée.
  GCreateImageData createImage(GCreateImageVars vars) {
    final String fileKey = vars.fileKey;
    final image = store.getMediaImage(fileKey);

    return GCreateImageData(createImage: imageToGql(image));
  }
}
