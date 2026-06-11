import 'dart:io';

class UploadCarouselImageCommand {
  UploadCarouselImageCommand({
    required this.file,
    required this.type,
    required this.onProgress,
  });

  final File file;
  final String type;
  final void Function(double progress) onProgress;
}
