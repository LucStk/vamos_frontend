import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_application/patches/upload_status.dart';
import 'package:vamos_cartographie/core/injection/queries/graph_queries.dart';
import "thumbnails/thumbnail_view.dart";

class ImageCarouselView<T> extends ConsumerWidget {
  final Id<T> id;
  final double thumbSize = 80;

  const ImageCarouselView({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. On passe les images directement au provider.
    // Riverpod va créer ou récupérer l'état existant de manière totalement sécurisée.
    final imagesAsync = ref.watch(entityImagesProvider(id));
    return imagesAsync.when(
      loading: () => const CircularProgressIndicator(),
      error: (_, _) => const Text("Error"),
      data: (imagesUi) {
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
      },
    );
  }
}
