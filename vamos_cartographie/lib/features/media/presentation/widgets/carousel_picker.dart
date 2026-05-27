import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image_picker/image_picker.dart';

import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import '../providers/carousel_notifier.dart';

import 'thumbnails/thumbnails.dart';

class ImageCarouselPicker extends ConsumerStatefulWidget {
  final List<MediaImage> remoteImages;

  final void Function(List<MediaImage> images) onChanged;

  final double thumbSize;

  const ImageCarouselPicker({
    super.key,
    required this.remoteImages,
    required this.onChanged,
    this.thumbSize = 80,
  });

  @override
  ConsumerState<ImageCarouselPicker> createState() =>
      _ImageCarouselPickerState();
}

class _ImageCarouselPickerState extends ConsumerState<ImageCarouselPicker> {
  late final String _carouselId;

  @override
  void initState() {
    super.initState();

    // ID unique pour cette instance widget
    _carouselId = UniqueKey().toString();

    // Initialisation UNE seule fois
    Future.microtask(() {
      ref
          .read(carouselProvider(_carouselId).notifier)
          .initialize(widget.remoteImages);
    });
  }

  Future<void> _pickImages() async {
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

    ref.read(carouselProvider(_carouselId).notifier).addLocalImages(picked);
  }

  @override
  Widget build(BuildContext context) {
    final provider = carouselProvider(_carouselId);

    final state = ref.watch(provider);

    final notifier = ref.read(provider.notifier);

    ref.listen(provider, (_, next) {
      widget.onChanged(next.remoteImages);
    });

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final item in state.items)
          ThumbnailPicker(
            key: ValueKey(item.fileKey),

            item: item,

            size: widget.thumbSize,

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

        ThumbnailButtonAdd(size: widget.thumbSize, onTap: _pickImages),
      ],
    );
  }
}
