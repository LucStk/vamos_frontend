import 'dart:io';
import 'package:domain_core/id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_application/patches/patch_image.dart';
import 'package:media_application/patches/upload_status.dart';
import 'package:media_application/read_models/image_ui_model.dart';
import 'package:trip_domain/domain/entities/media_image.dart';
import 'package:vamos_cartographie/core/injection/queries/media_queries.dart';
import 'package:vamos_cartographie/features/carousel/help/image_picker_service.dart';

import 'thumbnails/thumbnails.dart';

class ImageCarouselPicker extends ConsumerWidget {
  final Id entityId;
  final double thumbSize = 80;
  const ImageCarouselPicker({super.key, required this.entityId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesAsync = ref.watch(entityImagesProvider(entityId));
    return imagesAsync.when(
      loading: () => const CircularProgressIndicator(),
      error: (_, _) => const Text("Error"),
      data: (imagesUi) {
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
                  notifier.deleteItem(item);
                },
                onRetry: () {
                  notifier.retryUpload(item);
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
      },
    );
  }
}
