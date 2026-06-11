import 'package:dio/dio.dart';
import "storage_datasource.dart";

class DioStorageDatasource implements StorageDatasource {
  final Dio dio;

  DioStorageDatasource(this.dio);

  @override
  Future<void> uploadFile({
    required String url,
    required Stream<List<int>> data,
    required int length,
    required String contentType,
    void Function(int sent, int total)? onProgress,
  }) {
    return dio.put(
      url,
      data: data,
      options: Options(
        headers: {'Content-Type': contentType, 'Content-Length': length},
      ),
      onSendProgress: (s, t) => onProgress?.call(s, t),
    );
  }
}
