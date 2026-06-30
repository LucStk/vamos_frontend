import 'package:dio/dio.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
import 'package:vamos_cartographie/infrastructure/media/storage_datasource.dart';

part "dio_media_provider.g.dart";

@riverpod
StorageDatasource dioMedia(Ref ref) {
  return _DioStorageDatasource(Dio());
}

class _DioStorageDatasource implements StorageDatasource {
  _DioStorageDatasource(this._dio);

  final Dio _dio;

  @override
  Future<void> uploadFile({
    required String url,
    required Stream<List<int>> data,
    required int length,
    required String contentType,
    void Function(int sent, int total)? onProgress,
  }) {
    return _dio.put(
      url,
      data: data,
      options: Options(
        headers: {'Content-Type': contentType, 'Content-Length': length},
      ),
      onSendProgress: (s, t) => onProgress?.call(s, t),
    );
  }
}
