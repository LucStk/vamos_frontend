import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/trip_image.dart';
import "carousel_thumbnail.dart";
import "carousel_add_button.dart";
import "carousel_lightbox.dart";
import "providers/carousel_notifier.dart"; // Ton nouveau notifier

class ImageCarouselPicker extends ConsumerWidget {
  final List<TripImage> remoteImages;
  final void Function(List<TripImage> images) onChanged;
  final bool readOnly;
  final double thumbSize;

  const ImageCarouselPicker({
    super.key,
    required this.remoteImages,
    required this.onChanged,
    this.readOnly = false,
    this.thumbSize = 80,
  });

  // Future<void> _pickImages(BuildContext context, WidgetRef ref) async {
  //   List    // On envoie les chemins au Notifier
  //   ref.read(carouselProvider.notifier).addLocalImages(picked, onChanged);
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. On passe les images directement au provider.
    // Riverpod va créer ou récupérer l'état existant de manière totalement sécurisée.
    final carouselState = ref.watch(carouselProvider(remoteImages));
    final items = carouselState.items;

    if (items.isEmpty && readOnly) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (int i = 0; i < items.length; i++)
          Thumbnail(
            key: ValueKey('${items[i].value}_${items[i].displayUrl.hashCode}'),
            index: i,
            size: thumbSize,
            readOnly: readOnly,
            // 2. On passe la liste d'images d'origine au provider pour que le Thumbnail
            // puisse cibler exactement la bonne "famille" de provider.
            remoteImages: remoteImages,
            onChanged: onChanged,
          ),

        if (!readOnly)
          AddButton(
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
