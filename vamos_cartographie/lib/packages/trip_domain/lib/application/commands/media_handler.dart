import 'package:trip_domain/application/repositories/media_repository.dart';
import 'package:trip_domain/domain/media_image.dart';
import 'dart:io';

class MediaHandler {
  final MediaRepository repo;
  MediaHandler(this.repo);

  Future<MediaImage> uploadMedia(
    File file,
    String type,
    Function(double progress) onProgressCallback, //affiche le progrés
  ) async {
    onProgress(sent, total) {
      final double progress = total > 0 ? sent / total : 0;
      onProgressCallback(progress);
    }

    final result = await repo.uploadImage(file, type, onProgress);
    return result.fold((f) => throw Exception(f.message), (m) => m);
  }
}
