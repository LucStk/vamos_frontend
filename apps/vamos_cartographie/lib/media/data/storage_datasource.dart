abstract class StorageDatasource {
  Future<void> uploadFile({
    required String url,
    required Stream<List<int>> data,
    required int length,
    required String contentType,
    void Function(int sent, int total)? onProgress,
  });
}
