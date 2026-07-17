import 'package:dio/dio.dart';

class UploadService {
  UploadService(this._dio);

  final Dio _dio;

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
