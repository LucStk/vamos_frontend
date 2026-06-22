import 'dart:io';

import 'package:domain_core/media.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_ui_model.freezed.dart';

enum UploadStatus { idle, uploading, success, failure }

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
