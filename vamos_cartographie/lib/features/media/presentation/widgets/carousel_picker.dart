import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. On passe les images directement au provider.
    // Riverpod va créer ou récupérer l'état existant de manière totalement sécurisée.
    final items = CarouselItem.fromRemote(remoteImages);

    if (items.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (int i = 0; i < items.length; i++)
          ThumbnailPicker(
            item: items[i],
            key: ValueKey('${items[i].value}_${items[i].displayUrl.hashCode}'),
            size: thumbSize,
          ),

        ThumbnailButtonAdd(
          size: thumbSize,
          onTap: () {
            throw Exception(
              "Dans carousel_picker -> AddButton onTap not implémented",
            );
          },
        ), // () => _pickImages(context, ref)),
      ],
    );
  }
}
