import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/carousel/domain/entities/entities.dart';
import 'dart:io';
import 'thumbnail_error.dart';
import 'thumbnail_loading.dart';

class ThumbnailImage extends StatelessWidget {
  final CarouselItem item;
  final VoidCallback? onRetry;

  const ThumbnailImage({super.key, required this.item, this.onRetry});

  @override
  Widget build(BuildContext context) {
    if (item.isLocal) {
      return Image.file(
        File(item.fileKey),
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => ThumbnailError(onTap: onRetry),
      );
    }

    return Image.network(
      item.displayUrl,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const ThumbnailLoading();
      },
      errorBuilder: (_, _, _) => ThumbnailError(onTap: onRetry),
    );
  }
}
