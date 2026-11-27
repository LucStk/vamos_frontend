import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import '/domain_features/stored_file/injection/injection.dart';
import "widgets/widgets.dart";
import 'dart:io';

class ThumbnailPicker extends ConsumerWidget {
  final StoredFileId fileId;
  final double size;
  final VoidCallback? onTap;

  /// Poignée pour déplacer l'image, posée en bas à gauche.
  final Widget? dragHandle;

  /// La première image sert de couverture : on le montre.
  final bool isCover;

  const ThumbnailPicker({
    super.key,
    required this.fileId,
    required this.size,
    this.onTap,
    this.dragHandle,
    this.isCover = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(storeFileProvider(fileId));
    final notifier = ref.watch(storedFileStoreProvider.notifier);

    return GestureDetector(
      onTap: file.hasError ? null : onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              switch (file) {
                StoredFilePatchModel(
                  :final File file,
                  :final UploadStatus status,
                ) =>
                  Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.file(
                        file,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => ThumbnailError(),
                      ),
                      if (status == UploadStatus.uploading)
                        const ThumbnailLoading(),
                    ],
                  ),
                StoredFileRemoteModel(:final String url) => Image.network(
                  url,
                  fit: BoxFit.cover,
                  loadingBuilder: (_, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const ThumbnailLoading();
                  },
                  errorBuilder: (_, _, _) => ThumbnailError(),
                ),
              },
              // Overlays d'états globaux
              if (file.hasError) ThumbnailError(),

              if (isCover && !file.hasError)
                const Positioned(top: 4, left: 4, child: _CoverBadge()),

              if (dragHandle != null && !file.hasError)
                Positioned(left: 0, bottom: 0, child: dragHandle!),

              // Bouton Supprimer
              if (!file.hasError)
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    behavior: HitTestBehavior
                        .opaque, // Assure que tout le clic est capturé
                    onTap: () => notifier.deleteFile(id: file.id),
                    child: const ThumbnailDeleteButton(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoverBadge extends StatelessWidget {
  const _CoverBadge();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Icon(Icons.star, color: Colors.amber, size: 12),
      ),
    );
  }
}
