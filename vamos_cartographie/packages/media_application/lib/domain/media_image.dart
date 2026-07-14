import 'dart:io';

import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_application/domain/domain.dart';
part "media_image.freezed.dart";

sealed class ImageLocation {
  const ImageLocation();
}

class LocalPath extends ImageLocation {
  final File file;
  const LocalPath(this.file);
}

class RemoteUrl extends ImageLocation {
  final Url url;
  const RemoteUrl(this.url);
}

@freezed
abstract class MediaImage with _$MediaImage implements Patchable<MediaImage> {
  const MediaImage._();
  const factory MediaImage({
    required Id<MediaImage> fileKey,
    required ImageLocation location,
  }) = _MediaImage;

  @override
  Patch<MediaImage> createPatch() {
    return MediaImagePatch.internal(
      fileKey: fileKey,
      location: location,
      recomputing: false,
    );
  }
}

@freezed
abstract class MediaImagePatch
    with _$MediaImagePatch
    implements Patch<MediaImage> {
  @Implements<Patch<MediaImage>>()
  const factory MediaImagePatch.internal({
    required Id<MediaImage> fileKey,
    required ImageLocation location,
    required bool recomputing,
    @Default(UploadStatus.idle) UploadStatus? status,
    @Default(0) int? sent,
    @Default(0) int? total,
    String? error,
    FileKey? resolvedFileKey,
  }) = _MediaImagePatch;

  const MediaImagePatch._();

  factory MediaImagePatch({
    required Id<MediaImage> fileKey,
    required ImageLocation location,
    bool recomputing = false,
    Object? error,
  }) {
    return MediaImagePatch.internal(
      fileKey: fileKey,
      location: location,
      recomputing: recomputing,
    );
  }

  @override
  MediaImage toEntity() => MediaImage(fileKey: fileKey, location: location);
}
