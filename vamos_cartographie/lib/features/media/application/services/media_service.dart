import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/media/data/data.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'dart:io';

class MediaService {
  final MediaRepository _repo;
  MediaService(this._repo);

  Future<MediaImage> uploadMedia(
    File imageFile,
    String type,
    Function(int sent, int total)? onProgress,
  ) async {
    final result = await _repo.uploadImage(imageFile, type, onProgress);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (media) => media,
    );
  }
}


