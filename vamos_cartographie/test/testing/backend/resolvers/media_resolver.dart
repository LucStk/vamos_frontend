import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../fake_graphql_store.dart';
import 'gql_mappers.dart';

/// Résout les opérations GraphQL relatives aux médias.
class MediaResolver {
  final FakeGraphQLStore store;

  /// URL de base utilisée pour les pre-signed URLs fictives.
  static const _fakeUploadBase = 'https://fake-storage.example.com/upload';

  MediaResolver(this.store);

  /// Génère une URL d'upload fictive et enregistre le futur [CarouselItem]
  /// dans le store avec le statut [UploadStatus.idle].
  ///
  /// Dans le fake, l'upload réel est simulé (aucun fichier n'est transféré).
  /// L'image devient disponible côté store lors de l'appel à [createImage].
  Map<String, dynamic> generateImageUploadUrl(Map<String, dynamic> variables) {
    final extension = variables['extension'] as String;
    final fileKey =
        'media/fake_${DateTime.now().microsecondsSinceEpoch}.$extension';
    final uploadUrl = '$_fakeUploadBase/$fileKey';

    // Réserve l'entrée dans le store pour que attachImage* puisse s'y référer.
    store.carouselItems[fileKey] = CarouselItem.local(fileKey: fileKey);

    return GGenerateImageUploadUrlData(
      generateImageUploadUrl:
          GGenerateImageUploadUrlData_generateImageUploadUrl(
            fileKey: fileKey,
            uploadUrl: uploadUrl,
          ),
    ).toJson();
  }

  /// Marque l'image [fileKey] comme distante (upload terminé) dans le store.
  ///
  /// Si la clé n'existe pas encore dans le store, elle est créée.
  Map<String, dynamic> createImage(Map<String, dynamic> variables) {
    final fileKey = variables['fileKey'] as String;
    final url = 'https://cdn.example.com/$fileKey';

    final image = MediaImage(fileKey: fileKey, url: url);
    store.carouselItems[fileKey] = CarouselItem.remote(image: image);

    return GCreateImageData(createImage: imageToGql(image)).toJson();
  }
}
