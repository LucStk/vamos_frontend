import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/trip_image.dart';
import "thumbnail/thumbnail_view.dart";
import "providers/carousel_notifier.dart"; // Ton nouveau notifier

class ImageCarouselView extends ConsumerWidget {
  final List<TripImage> remoteImages;
  final double thumbSize;

  const ImageCarouselView({
    super.key,
    required this.remoteImages,
    this.thumbSize = 80,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. On passe les images directement au provider.
    // Riverpod va créer ou récupérer l'état existant de manière totalement sécurisée.
    final items = carouselState.items;

    if (items.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (int i = 0; i < items.length; i++)
          ThumbnailView(
            item: items[i],
            key: ValueKey('${items[i].value}_${items[i].displayUrl.hashCode}'),
            size: thumbSize,
          ),
      ],
    );
  }
}
