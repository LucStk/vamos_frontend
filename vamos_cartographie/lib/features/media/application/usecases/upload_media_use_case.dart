import 'dart:io';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/media/data/data.dart';

class UploadMediaUseCase {
  UploadMediaUseCase(this._repo);

  final MediaRepository _repo;

  Future<MediaImage> call(
    File file,
    String type, {
    void Function(int sent, int total)? onProgress,
  }) async {
    final result = await _repo.uploadImage(file, type, onProgress);

    return result.fold((f) => throw Exception(f.message), (m) => m);
  }
}
