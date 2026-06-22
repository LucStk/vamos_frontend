import 'dart:io';
import 'package:domain_core/media.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
part 'patch_image.freezed.dart';

enum UploadStatus { idle, uploading, success, failure }

@freezed
abstract class PatchImageMedia with _$PatchImageMedia {
  const factory PatchImageMedia({
    required FileKey fileKey,
    required File file,
    @Default(UploadStatus.idle) UploadStatus uploadStatus,
    @Default(0.0) double progress,
    @Default(null) String? error, // 💡 Ajout de @Default(null) pour harmoniser
  }) = _PatchImageMedia;
}
