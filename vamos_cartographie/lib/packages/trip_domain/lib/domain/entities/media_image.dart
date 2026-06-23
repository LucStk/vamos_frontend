import 'package:domain_core/media.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "media_image.freezed.dart";

@freezed
abstract class MediaImage with _$MediaImage {
  const factory MediaImage({required FileKey fileKey, required Url url}) =
      _MediaImage;
}
