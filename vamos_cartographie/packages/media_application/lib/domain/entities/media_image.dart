import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_application/domain/domain.dart';
part "media_image.freezed.dart";

@freezed
abstract class MediaImage with _$MediaImage {
  const factory MediaImage({required FileKey fileKey, required Url url}) =
      _MediaImage;
}
