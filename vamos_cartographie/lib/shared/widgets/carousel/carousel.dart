import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<void> _pickImages(BuildContext context, WidgetRef ref) async {
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

    // On envoie les chemins au Notifier
    ref.read(carouselProvider.notifier).addLocalImages(picked, onChanged);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Synchronisation initiale des images distantes arrivant de la BDD
    ref.read(carouselProvider.notifier).initImages(remoteImages);

    // On écoute l'état du carrousel
    final carouselState = ref.watch(carouselProvider);
    final items = carouselState.items;

    if (items.isEmpty && readOnly) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (int i = 0; i < items.length; i++)
          Thumbnail(
            key: ValueKey('${items[i].value}_${items[i].displayUrl.hashCode}'),
            item: items[i],
            size: thumbSize,
            uploadProgress: carouselState.uploadProgress[items[i].value],
            uploadError: carouselState.uploadErrors[items[i].value],
            readOnly: readOnly,
            onTap: () => showDialog(
              context: context,
              barrierColor: Colors.black87,
              useSafeArea: false,
              builder: (_) =>
                  LightBox(items: List.from(items), initialIndex: i),
            ),
            onDelete: () =>
                ref.read(carouselProvider.notifier).deleteItem(i, onChanged),
            onRetry: () => ref
                .read(carouselProvider.notifier)
                .uploadItem(items[i], onChanged),
          ),

        if (!readOnly)
          AddButton(size: thumbSize, onTap: () => _pickImages(context, ref)),
      ],
    );
  }
}
