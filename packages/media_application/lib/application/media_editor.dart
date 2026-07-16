import 'package:domain_core/domain_core.dart';
import 'package:media_application/application/upload_service.dart';
import 'package:media_application/media_application.dart';

mixin MediaEditor on OptimisticRunner<MediaStore> {
  MediaRepository get mediaRepo;
  UploadService get uploadService;
}
