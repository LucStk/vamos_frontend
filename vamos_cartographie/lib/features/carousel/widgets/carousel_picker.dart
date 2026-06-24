import 'package:domain_core/id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_application/domain/value_objects/upload_status.dart';
import 'package:vamos_cartographie/core/injection/commands.dart/media_provider.dart';
import 'package:vamos_cartographie/core/injection/queries/media_ui_queries.dart';
import 'package:vamos_cartographie/features/carousel/help/image_picker_service.dart';

import 'thumbnails/thumbnails.dart';

class ImageCarouselPicker<T> extends ConsumerWidget {
  final Id<T> id;
  final double thumbSize = 80;
  const ImageCarouselPicker({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesUi = ref.watch(entityImagesProvider(id));
    final mediaHandler = ref.read(mediaHandlerProvider);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final item in imagesUi)
          ThumbnailPicker(
            key: ValueKey(item.fileKey),
            item: item,
            size: thumbSize,
            isUploading: item.uploadStatus == UploadStatus.uploading,
            hasError: item.uploadStatus == UploadStatus.failure,
            onDelete: () {
              mediaHandler.removeImage<T>(id, item.fileKey);
            },
            onRetry: () {
              // mediaHandler.addImage<T>(id, item);
            },
            onTap: () {
              // TODO lightbox
            },
          ),

        ThumbnailButtonAdd(
          size: thumbSize,
          onTap: () => pickImages(context, ref),
        ),
      ],
    );
  }
}
