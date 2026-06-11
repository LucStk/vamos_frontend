import "package:vamos_cartographie/core/backend/network/storage_datasource.dart";

class FakeStorageDatasource implements StorageDatasource {
  FakeStorageDatasource();

  @override
  Future<void> uploadFile({
    required String url,
    required Stream<List<int>> data,
    required int length,
    required String contentType,
    void Function(int sent, int total)? onProgress,
  }) async {
    // simulation de progression

    onProgress?.call(25, 100);
    await Future.delayed(const Duration(milliseconds: 50));

    onProgress?.call(75, 100);
    await Future.delayed(const Duration(milliseconds: 50));

    onProgress?.call(100, 100);
  }
}
