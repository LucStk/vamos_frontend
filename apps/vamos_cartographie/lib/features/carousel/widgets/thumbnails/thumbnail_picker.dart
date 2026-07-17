import 'package:flutter/material.dart';
import 'package:stored_file_application/domain/entities/image_ui_model.dart';
import 'thumbnail_error.dart';
import 'thumbnail_loading.dart';
import 'thumbnail_image.dart'; // Pense à importer ton nouveau widget
import 'thumbnail_delete_button.dart';

class ThumbnailPicker extends StatelessWidget {
  final ImageUiModel item;
  final double size;
  final bool isUploading;
  final bool hasError;

  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onRetry;

  const ThumbnailPicker({
    super.key,
    required this.item,
    required this.size,
    this.isUploading = false,
    this.hasError = false,
    this.onTap,
    this.onDelete,
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

              // Overlays d'états globaux
              if (isUploading) const ThumbnailLoading(),
              if (hasError) ThumbnailError(onTap: onRetry),

              // Bouton Supprimer
              if (!isUploading && !hasError)
                ThumbnailDeleteButton(onTap: onDelete),
            ],
          ),
        ),
      ),
    );
  }
}
