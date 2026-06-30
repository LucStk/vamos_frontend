import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_application/domain/entities/media_image.dart';
import 'package:media_application/domain/types/media_types.dart';
import 'patch_image.dart';
import '/domain/value_objects/upload_status.dart';

part 'image_ui_model.freezed.dart';

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
abstract class ImageUiModel with _$ImageUiModel {
  const factory ImageUiModel({
    required FileKey fileKey,
    required ImageLocation imageLocation,
    @Default(UploadStatus.idle) UploadStatus uploadStatus,
    @Default(0.0) double progress,
    String? error,
  }) = _ImageUiModel;
}

// media_image_extensions.dart
extension MediaImageUi on MediaImage {
  ImageUiModel toUiModel() => ImageUiModel(
    fileKey: fileKey,
    imageLocation: RemoteUrl(url),
    uploadStatus: UploadStatus.success,
  );
}

// patch_image_extensions.dart
extension PatchImageUi on PatchImageMedia {
  ImageUiModel toUiModel(UploadStatus status) => ImageUiModel(
    fileKey: fileKey,
    imageLocation: LocalPath(file),
    uploadStatus: status,
  );
}
