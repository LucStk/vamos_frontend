import 'package:dio/dio.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
import 'package:vamos_cartographie/infrastructure/media/storage_datasource.dart';
part "dio_media_handler.g.dart";

@Riverpod(keepAlive: true)
class DioMediaHandler implements StorageDatasource {
  final Dio dio = Dio();

  @override
  void build() {
    return;
  }

  // TODO: implement hashCode
  int get hashCode => super.hashCode;

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
