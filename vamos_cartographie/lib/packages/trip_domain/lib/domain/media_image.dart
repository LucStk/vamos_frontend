import 'package:freezed_annotation/freezed_annotation.dart';
part "media_image.freezed.dart";

@freezed
abstract class MediaImage with _$MediaImage {
  // <-- 'class' au lieu de 'abstract class'
  const factory MediaImage({required String fileKey, required String url}) =
      _MediaImage;
}
