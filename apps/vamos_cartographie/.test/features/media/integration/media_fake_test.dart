import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trip_application/domain/media_image.dart';
import 'package:vamos_cartographie/backend/seeds/explore_seed.dart';
import 'package:vamos_cartographie/features/carousel/application/carousel_notifier.dart';
import 'package:vamos_cartographie/infrastructure/media/media_remote_datasource.dart';
import 'package:vamos_cartographie/infrastructure/media/media_repository_impl.dart';
import '../../../helpers/fake_backend_builder.dart';
import '../../../helpers/fake_storage_datasource.dart';

// ---------------------------------------------------------------------------
// Helpers locaux
// ---------------------------------------------------------------------------

/// Construit un [MediaRemoteDatasource] connecté au fake backend.
MediaRemoteDatasource buildMediaRemote() {
  final (:client, store: _) = buildFakeBackend(exploreSeed);
  return MediaRemoteDatasource(client);
}

/// Construit un [MediaRepository] avec fake backend + fake storage.
/// Retourne aussi le [FakeStorageDatasource] pour les assertions.
({MediaRepository repo, FakeStorageDatasource storage}) buildMediaRepo() {
  final (:client, store: _) = buildFakeBackend(exploreSeed);
  final storage = FakeStorageDatasource();
  final repo = MediaRepository(
    remote: MediaRemoteDatasource(client),
    storage: storage,
  );
  return (repo: repo, storage: storage);
}

void main() {
  // =========================================================================
  // MediaRemoteDatasource — couche transport GQL
  // =========================================================================

  group('MediaRemoteDatasource avec Fake Client', () {
    group('getSignedURL', () {
      test('retourne un fileKey et un uploadUrl valides', () async {
        // Given: fake backend prêt à générer une URL signée
        // When: getSignedURL est appelé avec extension "png"
        // Then: un fileKey et un uploadUrl sont retournés
        final remote = buildMediaRemote();

        final result = await remote.getSignedURL('png');

        expect(result.fileKey, isNotEmpty);
        expect(result.uploadUrl, isNotEmpty);
      });

      test('le fileKey est différent à chaque appel', () async {
        // Given: deux appels successifs à getSignedURL
        // When: getSignedURL est appelé deux fois
        // Then: les fileKeys sont différents (évite les collisions)
        final remote = buildMediaRemote();

        final r1 = await remote.getSignedURL('jpg');
        final r2 = await remote.getSignedURL('jpg');

        expect(r1.fileKey, isNot(r2.fileKey));
      });
    });

    group('createMediaData', () {
      test('retourne une MediaImage avec url et fileKey', () async {
        // Given: un fileKey valide
        // When: createMediaData est appelé avec ce fileKey
        // Then: une MediaImage est retournée avec url et fileKey non vides
        final remote = buildMediaRemote();
        const fileKey = 'media/test_image.jpg';

        final image = await remote.createMediaData(fileKey);

        expect(image.fileKey, fileKey);
        expect(image.url, isNotEmpty);
        expect(image.url, contains(fileKey));
      });

      test("l'url contient le fileKey dans son chemin", () async {
        // Given: un fileKey avec un chemin connu
        // When: createMediaData est appelé
        // Then: l'url pointe vers le fileKey
        final remote = buildMediaRemote();
        const fileKey = 'media/photos/myphoto.png';

        final image = await remote.createMediaData(fileKey);

        expect(image.url, contains('myphoto.png'));
      });
    });
  });

  // =========================================================================
  // MediaRepository — couche données (upload complet)
  // =========================================================================

  group('MediaRepository avec Fake Client', () {
    late File testImageFile;

    setUp(() async {
      // Crée un fichier image temporaire (3 octets JPEG minimaux)
      testImageFile = File('${Directory.systemTemp.path}/test_upload.jpg');
      await testImageFile.writeAsBytes([0xFF, 0xD8, 0xFF]);
    });

    tearDown(() async {
      if (await testImageFile.exists()) await testImageFile.delete();
    });

    test("uploadImage retourne Right(MediaImage) en cas de succès", () async {
      // Given: un fichier image valide et un fake storage opérationnel
      // When: uploadImage est appelé
      // Then: Right(MediaImage) est retourné avec un fileKey et une url
      final (:repo, storage: _) = buildMediaRepo();

      final result = await repo.uploadImage(testImageFile, 'jpg', null);

      expect(result.isRight(), isTrue);
      result.fold((_) => fail('Expected Right'), (image) {
        expect(image.fileKey, isNotEmpty);
        expect(image.url, isNotEmpty);
      });
    });

    test("uploadImage appelle bien le storage", () async {
      // Given: un fichier image valide
      // When: uploadImage est appelé
      // Then: le storage reçoit bien l'appel d'upload
      final (:repo, :storage) = buildMediaRepo();

      await repo.uploadImage(testImageFile, 'jpg', null);

      expect(storage.wasUploadCalled, isTrue);
    });

    test("uploadImage transmet le bon contentType au storage", () async {
      // Given: un fichier PNG
      // When: uploadImage est appelé avec extension "png"
      // Then: le contentType est 'image/png'
      final pngFile = File('${Directory.systemTemp.path}/test_upload.png');
      await pngFile.writeAsBytes([0x89, 0x50, 0x4E, 0x47]); // PNG magic bytes
      addTearDown(() async {
        if (await pngFile.exists()) await pngFile.delete();
      });

      // On crée un storage dédié qui capture le contentType
      String? capturedContentType;
      final capturingStorage = _CapturingStorageDatasource(
        onUpload: (contentType) => capturedContentType = contentType,
      );
      final (:client, store: _) = buildFakeBackend(exploreSeed);
      final repo = MediaRepository(
        remote: MediaRemoteDatasource(client),
        storage: capturingStorage,
      );

      await repo.uploadImage(pngFile, 'png', null);

      expect(capturedContentType, 'image/png');
    });

    test("uploadImage normalise jpg → jpeg pour le contentType", () async {
      // Given: extension "jpg" (alias courant)
      // When: uploadImage est appelé
      // Then: l'extension est normalisée en "jpeg" pour l'upload S3
      String? capturedContentType;
      final capturingStorage = _CapturingStorageDatasource(
        onUpload: (contentType) => capturedContentType = contentType,
      );
      final (:client, store: _) = buildFakeBackend(exploreSeed);
      final repo = MediaRepository(
        remote: MediaRemoteDatasource(client),
        storage: capturingStorage,
      );

      await repo.uploadImage(testImageFile, 'jpg', null);

      expect(capturedContentType, 'image/jpeg');
    });
  });

  // =========================================================================
  // CarouselNotifier — état seul (sans upload réel)
  // =========================================================================

  group('CarouselNotifier (gestion d\'état)', () {
    // CarouselNotifier.build() est synchrone et ne dépend pas de providers
    // externes → pas besoin d'override des providers pour tester initialize/delete.

    test("état initial est vide", () {
      // Given: un CarouselNotifier fraîchement créé
      // When: aucune action n'est effectuée
      // Then: l'état est vide
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final state = container.read(carouselProvider('carousel-1'));

      expect(state.items, isEmpty);
    });

    test("initialize remplit l'état avec les images distantes", () {
      // Given: une liste de MediaImages
      // When: initialize est appelé
      // Then: l'état contient autant d'items que d'images, tous distants
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final images = [
        MediaImage(fileKey: 'key-1', url: 'https://cdn.example.com/1.jpg'),
        MediaImage(fileKey: 'key-2', url: 'https://cdn.example.com/2.jpg'),
        MediaImage(fileKey: 'key-3', url: 'https://cdn.example.com/3.jpg'),
      ];
      container
          .read(carouselProvider('carousel-2').notifier)
          .initialize(images);

      final state = container.read(carouselProvider('carousel-2'));
      expect(state.items, hasLength(3));
      expect(state.items.every((i) => i.isRemote), isTrue);
    });

    test("initialize est idempotent (deuxième appel ignoré)", () {
      // Given: un carousel déjà initialisé
      // When: initialize est appelé une deuxième fois avec d'autres images
      // Then: l'état ne change pas (les items originaux sont conservés)
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final initialImages = [
        MediaImage(fileKey: 'key-a', url: 'https://cdn.example.com/a.jpg'),
      ];
      container
          .read(carouselProvider('carousel-3').notifier)
          .initialize(initialImages);

      final moreImages = [
        MediaImage(fileKey: 'key-b', url: 'https://cdn.example.com/b.jpg'),
        MediaImage(fileKey: 'key-c', url: 'https://cdn.example.com/c.jpg'),
      ];
      container
          .read(carouselProvider('carousel-3').notifier)
          .initialize(moreImages);

      final state = container.read(carouselProvider('carousel-3'));
      expect(state.items, hasLength(1));
      expect(state.items.first.fileKey, 'key-a');
    });

    test("deleteItem supprime l'item de l'état", () {
      // Given: un carousel avec 2 images
      // When: deleteItem est appelé sur la première image
      // Then: l'état ne contient plus que la deuxième image
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final images = [
        MediaImage(fileKey: 'key-x', url: 'https://cdn.example.com/x.jpg'),
        MediaImage(fileKey: 'key-y', url: 'https://cdn.example.com/y.jpg'),
      ];
      container
          .read(carouselProvider('carousel-4').notifier)
          .initialize(images);

      final itemToDelete = container
          .read(carouselProvider('carousel-4'))
          .items
          .first;
      container
          .read(carouselProvider('carousel-4').notifier)
          .deleteItem(itemToDelete);

      final state = container.read(carouselProvider('carousel-4'));
      expect(state.items, hasLength(1));
      expect(state.items.first.fileKey, 'key-y');
    });

    test("remoteImages retourne uniquement les images distantes", () {
      // Given: un carousel initialisé avec des images distantes
      // When: remoteImages est accédé
      // Then: toutes les images sont retournées comme MediaImage
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final images = [
        MediaImage(fileKey: 'k1', url: 'https://cdn.example.com/1.jpg'),
        MediaImage(fileKey: 'k2', url: 'https://cdn.example.com/2.jpg'),
      ];
      container
          .read(carouselProvider('carousel-5').notifier)
          .initialize(images);

      final state = container.read(carouselProvider('carousel-5'));
      expect(state.remoteImages, hasLength(2));
      expect(
        state.remoteImages.map((i) => i.fileKey),
        containsAll(['k1', 'k2']),
      );
    });
  });
}

// ---------------------------------------------------------------------------
// Helpers privés
// ---------------------------------------------------------------------------

/// Storage fake qui capture le contentType passé à uploadFile.
class _CapturingStorageDatasource
    implements
        // ignore: avoid_implementing_value_types
        FakeStorageDatasource {
  final void Function(String contentType) onUpload;

  _CapturingStorageDatasource({required this.onUpload});

  @override
  bool wasUploadCalled = false;

  @override
  bool shouldFail = false;

  @override
  void reset() {
    wasUploadCalled = false;
    shouldFail = false;
  }

  @override
  Future<void> uploadFile({
    required String url,
    required Stream<List<int>> data,
    required int length,
    required String contentType,
    void Function(int sent, int total)? onProgress,
  }) async {
    wasUploadCalled = true;
    onUpload(contentType);
    onProgress?.call(length, length);
  }
}
