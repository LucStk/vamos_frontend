import 'dart:io';

import 'package:domain_core/id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_application/media_application.dart';
import 'package:vamos_cartographie/core/injection/commands/media_provider.dart';
import 'package:vamos_cartographie/core/injection/queries/media_ui_queries.dart';
import 'package:vamos_cartographie/features/carousel/help/image_picker_service.dart';

import 'thumbnails/thumbnails.dart';

class ImageCarouselPicker<T> extends ConsumerWidget {
  final Id<T> id;
  final MediaOwnerType ownerType;
  final double thumbSize = 80;
  const ImageCarouselPicker({
    super.key,
    required this.id,
    required this.ownerType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesUi = ref.watch(visibleImagesProvider(id));
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
              mediaHandler.removeImage<T>(id, item.fileKey, ownerType);
            },
            onRetry: () {
              mediaHandler.retryImageUpload<T>(id, item.fileKey, ownerType);
            },
            onTap: () {
              // TODO lightbox
            },
          ),

        ThumbnailButtonAdd(
          size: thumbSize,
          onTap: () async {
            final picked = await pickImages();
            for (File f in picked) {
              mediaHandler.uploadPatchImage(
                id,
                generatePatchImage(f),
                ownerType,
              );
            }
          },
        ),
      ],
    );
  }
}
