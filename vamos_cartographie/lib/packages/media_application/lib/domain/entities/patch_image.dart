import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_application/domain/types/media_types.dart';
part 'patch_image.freezed.dart';

@freezed
abstract class PatchImageMedia with _$PatchImageMedia {
  const factory PatchImageMedia({
    required FileKey fileKey,
    required File file,
  }) = _PatchImageMedia;
}
