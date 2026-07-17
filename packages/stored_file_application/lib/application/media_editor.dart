import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/application/upload_service.dart';
import 'package:stored_file_application/stored_file_application.dart';

mixin MediaEditor on OptimisticRunner<MediaStore> {
  MediaRepository get mediaRepo;
  UploadService get uploadService;
}
