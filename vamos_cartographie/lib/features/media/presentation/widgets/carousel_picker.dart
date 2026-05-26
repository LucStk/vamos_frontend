import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';

import '../providers/carousel_notifier.dart';

import "thumbnails/thumbnails.dart";

class ImageCarouselPicker extends ConsumerWidget {
  final List<MediaImage> remoteImages;

  final void Function(List<MediaImage> images) onChanged;

  final double thumbSize;

  const ImageCarouselPicker({
    super.key,
    required this.remoteImages,
    required this.onChanged,
    this.thumbSize = 80,
  });

  Future<void> _pickImages(WidgetRef ref) async {
    List<String> picked = [];

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      const typeGroup = XTypeGroup(
        label: 'Images',
        extensions: ['jpg', 'jpeg', 'png', 'gif', 'webp'],
      );

      final files = await openFiles(acceptedTypeGroups: [typeGroup]);

      picked = files.map((f) => f.path).toList();
    } else {
      final picker = ImagePicker();

      final images = await picker.pickMultiImage();

      picked = images.map((x) => x.path).toList();
    }

    if (picked.isEmpty) return;

    ref.read(carouselProvider(remoteImages).notifier).addLocalImages(picked);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = carouselProvider(remoteImages);

    final state = ref.watch(provider);

    final notifier = ref.read(provider.notifier);

    // Synchronisation avec parent
    ref.listen(provider, (_, next) {
      onChanged(next.remoteImages);
    });

    final items = state.items;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final item in items)
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

        ThumbnailButtonAdd(size: thumbSize, onTap: () => _pickImages(ref)),
      ],
    );
  }
}
