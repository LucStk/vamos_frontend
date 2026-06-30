import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_application/domain/value_objects/upload_status.dart';
import 'package:vamos_cartographie/core/injection/media/media_injection.dart';
import "thumbnails/thumbnail_view.dart";

class ImageCarouselView<T> extends ConsumerWidget {
  final Id<T> id;
  final double thumbSize = 80;

  const ImageCarouselView({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesUi = ref.watch(syncedImagesProvider(id));

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final item in imagesUi)
          ThumbnailView(
            key: ValueKey(item.fileKey),
            item: item,
            size: thumbSize,
            hasError: item.uploadStatus == UploadStatus.failure,
          ),
      ],
    );
  }
}
