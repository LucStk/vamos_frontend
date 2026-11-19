import 'dart:math' as math;

import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/injection/injection.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/carousel_lightbox.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/thumbnail_view.dart';

// TODO: adapter le chemin vers LightBox.

/// Tout ce qui peut posséder des photos : trip, waypoint, route…
/// TODO: aligner sur le type exact attendu par `getFromOwner`.
typedef PhotoOwnerId = Id<HasId>;

/// Rangée de vignettes **non scrollable** des photos d'un propriétaire.
///
/// Une galerie horizontale scrollable dans le PageView du shell entrerait en
/// conflit avec le swipe entre les pages (même axe). On affiche donc autant de
/// vignettes que la largeur le permet, et la dernière devient "+N".
class OwnerPhotoStrip extends ConsumerWidget {
  const OwnerPhotoStrip({
    super.key,
    required this.ownerId,
    this.editable = false,
  });

  final PhotoOwnerId ownerId;
  final bool editable;

  static const double _size = 52;
  static const double _gap = 8;

  void _openLightBox(
    BuildContext context,
    WidgetRef ref,
    List<StoredFileId> fileIds,
    int index,
  ) {
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
    final fileIds = ref
        .watch(storedFileStoreProvider.select((s) => s.getFromOwner(ownerId)))
        .toList();

    if (fileIds.isEmpty) return _EmptyStrip(editable: editable, size: _size);

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

          return Row(
            children: [
              for (var i = 0; i < shown; i++)
                Padding(
                  padding: const EdgeInsets.only(right: _gap),
                  child: ThumbnailView(
                    key: ValueKey(fileIds[i]),
                    fileId: fileIds[i],
                    size: _size,
                    onTap: () => _openLightBox(context, ref, fileIds, i),
                  ),
                ),
              if (overflow)
                GestureDetector(
                  onTap: () => _openLightBox(context, ref, fileIds, shown),
                  child: _MoreTile(count: fileIds.length - shown, size: _size),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _EmptyStrip extends StatelessWidget {
  const _EmptyStrip({required this.editable, required this.size});

  final bool editable;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return SizedBox(
      height: size,
      child: Row(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              editable
                  ? Icons.add_photo_alternate_outlined
                  : Icons.image_outlined,
              size: 22,
              color: scheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              editable ? 'Ajoutez des photos' : 'Aucune photo',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoreTile extends StatelessWidget {
  const _MoreTile({required this.count, required this.size});

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
