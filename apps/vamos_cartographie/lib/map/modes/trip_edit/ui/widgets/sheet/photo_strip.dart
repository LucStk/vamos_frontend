import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/carousel_lightbox.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/thumbnail_view.dart';

/// Rangée de vignettes **non scrollable**.
///
/// Une galerie horizontale scrollable à l'intérieur du PageView entrerait en
/// conflit avec le swipe entre les pages (même axe). On affiche donc autant de
/// vignettes que la largeur le permet, et la dernière devient "+N". La galerie
/// complète vit dans le contenu déplié.
class TripPhotoStrip extends ConsumerWidget {
  const TripPhotoStrip({
    super.key,
    required this.fileIds,
    required this.editable,
  });

  final List<StoredFileId> fileIds;
  final bool editable;

  static const double _size = 52;
  static const double _gap = 8;

  void _openLightBox(BuildContext context, WidgetRef ref, int index) {
    final items = [for (final id in fileIds) ref.read(storeFileProvider(id))];
    showGeneralDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Fermer',
      barrierColor: Colors.black87,
      pageBuilder: (_, _, _) => LightBox(items: items, initialIndex: index),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (fileIds.isEmpty) {
      final theme = Theme.of(context);
      return SizedBox(
        height: _size,
        child: Row(
          children: [
            SizedBox(
              width: _size,
              height: _size,
              child: EmptyThumb(editable: editable),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                editable ? 'Ajoutez des photos' : 'Aucune photo',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: _size,
      child: LayoutBuilder(
        builder: (context, c) {
          final slots = math.max(
            1,
            ((c.maxWidth + _gap) / (_size + _gap)).floor(),
          );
          final overflow = fileIds.length > slots;
          final shown = overflow ? slots - 1 : fileIds.length;
          final hidden = fileIds.length - shown;

          return Row(
            children: [
              for (var i = 0; i < shown; i++)
                Padding(
                  padding: const EdgeInsets.only(right: _gap),
                  child: ThumbnailView(
                    key: ValueKey(fileIds[i]),
                    fileId: fileIds[i],
                    size: _size,
                    onTap: () => _openLightBox(context, ref, i),
                  ),
                ),
              if (overflow)
                GestureDetector(
                  onTap: () => _openLightBox(context, ref, shown),
                  child: MoreTile(count: hidden, size: _size),
                ),
            ],
          );
        },
      ),
    );
  }
}

class EmptyThumb extends StatelessWidget {
  const EmptyThumb({super.key, required this.editable});

  final bool editable;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        editable ? Icons.add_photo_alternate_outlined : Icons.image_outlined,
        size: 22,
        color: scheme.onSurfaceVariant,
      ),
    );
  }
}

class MoreTile extends StatelessWidget {
  const MoreTile({super.key, required this.count, required this.size});

  final int count;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text('+$count', style: theme.textTheme.titleSmall),
    );
  }
}
