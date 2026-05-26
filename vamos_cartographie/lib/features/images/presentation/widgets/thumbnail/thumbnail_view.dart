import 'package:flutter/material.dart';
import 'thumbnail_error.dart';
import 'thumbnail_image.dart'; // Pense à importer ton nouveau widget
import 'package:vamos_cartographie/features/images/domain/entities/carousel_item.dart';

class ThumbnailView extends StatelessWidget {
  final CarouselItem item;
  final double size;

  final bool hasError;

  final VoidCallback? onTap;
  final VoidCallback? onRetry;

  const ThumbnailView({
    super.key,
    required this.item,
    required this.size,
    this.hasError = false,
    this.onTap,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hasError ? null : onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ThumbnailImage(item: item, onRetry: onRetry),
              if (hasError) ThumbnailError(onTap: onRetry),
            ],
          ),
        ),
      ),
    );
  }
}
