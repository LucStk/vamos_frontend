import 'dart:io';

import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_application/domain/domain.dart';
part "media_image.freezed.dart";

@freezed
abstract class MediaImage with _$MediaImage implements Patchable<MediaImage> {
  const MediaImage._();
  const factory MediaImage({
    required Id<MediaImage> fileKey,
    required FileKey filkey,
    required Url url,
  }) = _MediaImage;
}

@freezed
abstract class MediaImagePatch
    with _$MediaImagePatch
    implements Patch<MediaImage> {
  @Implements<Patch<MediaImage>>()
  const factory MediaImagePatch.internal({
    required Id<MediaImage> id,
    required File file,
    required bool recomputing,
    @Default(UploadStatus.idle) UploadStatus? status,
    @Default(0) int? sent,
    @Default(0) int? total,
    String? error,
    FileKey? resolvedFileKey,
  }) = _MediaImagePatch;

  const MediaImagePatch._();

  factory MediaImagePatch({
    required Id<MediaImage> id,

    bool recomputing = false,
    Object? error,
  }) {
    return MediaImagePatch.internal(
      id: id,
      location: location,
      recomputing: recomputing,
    );
  }
}
