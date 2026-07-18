import 'package:stored_file_application/domain/domain.dart';

class UploadConfigModel {
  final StoredFileRemoteModel file;
  final String uploadUrl;
  final String fileKey;
  final String contentType;

  const UploadConfigModel({
    required this.file,
    required this.uploadUrl,
    required this.fileKey,
    required this.contentType,
  });
}
