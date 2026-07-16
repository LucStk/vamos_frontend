import 'dart:io';

import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "media_image.freezed.dart";

class FileKey {
  final String value;
  const FileKey(this.value);

  @override
  bool operator ==(Object other) => other is FileKey && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

class Url {
  final String value;
  const Url(this.value);

  @override
  bool operator ==(Object other) => other is Url && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

enum UploadStatus { idle, uploading, success, failure }

enum MediaOwnerType { waypoint, trip }

mixin MediaOwner on HasId {
  MediaOwnerType get mediaOwnerType;
}

abstract interface class Media {
  Id<MediaImage> get id;
  MediaOwner get owner;
}

@freezed
abstract class MediaImage
    with _$MediaImage
    implements Patchable<MediaImage>, Media {
  const factory MediaImage({
    required Id<MediaImage> id,
    required MediaOwner owner,
    required FileKey filkey,
    required Url url,
  }) = _MediaImage;

  const MediaImage._();
}

typedef MediaId = Id<MediaImage>;

@freezed
abstract class MediaImagePatch
    with _$MediaImagePatch
    implements Patch<MediaImage>, Media {
  @Implements<Patch<MediaImage>>()
  const factory MediaImagePatch.internal({
    required Id<MediaImage> id,
    required MediaOwner owner,
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
    required Id<MediaImage>? id,
    required MediaOwner owner,
    required File file,
    bool recomputing = false,
    Object? error,
  }) {
    return MediaImagePatch.internal(
      id: id ?? Id<MediaImage>.generate(),
      owner: owner,
      file: file,
      recomputing: recomputing,
    );
  }
}
