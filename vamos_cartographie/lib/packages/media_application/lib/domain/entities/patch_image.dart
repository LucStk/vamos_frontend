import 'dart:io';
import 'package:domain_core/media.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'patch_image.freezed.dart';

@freezed
abstract class PatchImageMedia with _$PatchImageMedia {
  const factory PatchImageMedia({
    required FileKey fileKey,
    required File file,
  }) = _PatchImageMedia;
}
