import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/media/application/controllers/upload_controller.dart';
import 'package:vamos_cartographie/features/media/application/usecases/upload_media_use_case.dart';
import 'package:vamos_cartographie/features/media/data/providers/media_providers.dart';

part 'media_providers.g.dart';

@riverpod
UploadMediaUseCase uploadMediaUseCase(Ref ref) {
  return UploadMediaUseCase(ref.read(mediaRepositoryProvider));
}

@riverpod
UploadCarouselImageController uploadCarouselImageController(Ref ref) {
  return UploadCarouselImageController(ref.read(uploadMediaUseCaseProvider));
}
