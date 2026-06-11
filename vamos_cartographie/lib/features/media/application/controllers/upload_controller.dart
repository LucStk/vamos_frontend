import 'package:vamos_cartographie/features/media/application/controllers/upload_carousel_commands.dart';
import 'package:vamos_cartographie/features/media/application/usecases/upload_media_use_case.dart';
import 'package:vamos_cartographie/features/media/domain/entities/carousel_item.dart';

class UploadCarouselImageController {
  UploadCarouselImageController(this._upload);

  final UploadMediaUseCase _upload;

  Future<MediaImage> call(UploadCarouselImageCommand cmd) async {
    final result = await _upload(
      cmd.file,
      cmd.type,
      onProgress: (sent, total) {
        final double progress = total > 0 ? sent / total : 0;
        cmd.onProgress(progress);
      },
    );

    return result;
  }
}
