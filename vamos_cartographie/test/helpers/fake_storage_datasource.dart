import 'package:vamos_cartographie/backend/backend.dart';

/// Implémentation fake de [StorageDatasource] pour les tests.
///
/// Ne fait pas de vraie requête HTTP : simule simplement l'upload.
/// Configurable pour simuler un succès ou une erreur.
class FakeStorageDatasource implements StorageDatasource {
  bool wasUploadCalled = false;
  bool shouldFail = false;

  /// Réinitialise l'état entre deux tests.
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
    if (shouldFail) throw Exception('Fake storage error');
    // Simule la progression
    onProgress?.call(length, length);
  }
}
