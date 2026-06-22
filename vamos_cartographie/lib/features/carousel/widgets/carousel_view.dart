import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_application/read_models/image_ui_model.dart';
import "thumbnails/thumbnail_view.dart";

class ImageCarouselView extends ConsumerWidget {
  final List<ImageUiModel> images;
  final double thumbSize;

  const ImageCarouselView({
    super.key,
    required this.images,
    this.thumbSize = 80,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. On passe les images directement au provider.
    // Riverpod va créer ou récupérer l'état existant de manière totalement sécurisée.

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (int i = 0; i < images.length; i++)
          ThumbnailView(
            item: images[i],
            key: ValueKey('${images[i].fileKey}'),
            size: thumbSize,
          ),
      ],
    );
  }
}
