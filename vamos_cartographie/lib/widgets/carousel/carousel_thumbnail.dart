import "package:flutter/material.dart";
import "carousel_item.dart";
import 'dart:io';

class Thumbnail extends StatelessWidget {
  final CarouselItem item;
  final double size;
  final double? uploadProgress;
  final String? uploadError;
  final bool readOnly;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onRetry;

  const Thumbnail({
    super.key,
    required this.item,
    required this.size,
    required this.uploadProgress,
    required this.uploadError,
    required this.readOnly,
    required this.onTap,
    required this.onDelete,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildImage(),

              // ── Spinner upload ──
              if (uploadProgress != null && uploadError == null)
                const ColoredBox(
                  color: Colors.black45,
                  child: Center(
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              // ── Erreur upload ──
              if (uploadError != null)
                ColoredBox(
                  color: Colors.black54,
                  child: Center(
                    child: GestureDetector(
                      onTap: onRetry,
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.refresh, color: Colors.white, size: 22),
                          SizedBox(height: 2),
                          Text(
                            'Réessayer',
                            style: TextStyle(color: Colors.white, fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              // ── Bouton suppression ──
              if (!readOnly && uploadProgress == null)
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: onDelete,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (item.isLocal) {
      return Image.file(
        File(item.value),
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _errorPlaceholder(),
      );
    }
    // item.displayUrl construit l'URL complète via AppConfig
    return Image.network(
      item.displayUrl,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, prog) {
        if (prog == null) return child;
        return const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
      },
      errorBuilder: (_, __, ___) => _errorPlaceholder(),
    );
  }

  Widget _errorPlaceholder() => Container(
    color: Colors.grey.shade200,
    child: Icon(
      Icons.broken_image_outlined,
      size: 28,
      color: Colors.grey.shade400,
    ),
  );
}
