import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_grid/reorderable_grid.dart';
import 'package:stored_file_application/stored_file_application.dart';
import '/domain_features/stored_file/injection/injection.dart';
import 'package:vamos_cartographie/app_services/app_services.dart';
import 'image_gallery.dart';
import 'widgets/widgets.dart';
import "thumbnail_picker.dart";

/// Les images d'un propriétaire, à ajouter, supprimer et **ordonner** : on
/// saisit la poignée d'une image et on la glisse tout de suite, sans appui
/// long ; les autres s'écartent pour lui faire place. La première sert de
/// couverture. Toucher une image l'ouvre en grand, pour la retoucher ou la
/// légender.
class ImageCarouselPicker<T> extends ConsumerWidget {
  final Id<T> id;
  final TargetType ownerType;
  final double thumbSize = 80;
  const ImageCarouselPicker({
    super.key,
    required this.id,
    required this.ownerType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(storedFileStoreProvider);
    final notifier = ref.watch(storedFileStoreProvider.notifier);
    final filesId = store.getFromOwner(id);

    // Une image en cours d'envoi n'existe pas encore côté serveur : on ne la
    // déplace pas.
    bool uploaded(StoredFileId fileId) =>
        store.get(fileId)?.isPendingCreation == false;

    void reorder(int from, int to) {
      // Le « + » reste en dernier : on ne peut pas passer derrière.
      final target = to > filesId.length - 1 ? filesId.length - 1 : to;
      if (from == target) return;
      final next = [...filesId];
      next.insert(target, next.removeAt(from));
      notifier.reorderFiles(
        targetId: id,
        targetType: ownerType,
        orderedIds: next,
      );
    }

    Future<void> add() async {
      final listFile = await pickImages();
      for (final file in listFile) {
        notifier.uploadFile(file: file, targetId: id, targetType: ownerType);
      }
    }

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ReorderableGridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: thumbSize,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: filesId.length + 1,
          // Seule la poignée saisit : le reste de la vignette garde le
          // défilement de la fiche et le toucher.
          buildDefaultDragHandles: false,
          itemDragEnable: (i) => i < filesId.length && uploaded(filesId[i]),
          onReorderStart: (_) => HapticFeedback.selectionClick(),
          onReorder: reorder,
          proxyDecorator: _lifted,
          itemBuilder: (context, i) {
            if (i == filesId.length) {
              return GestureDetector(
                key: const ValueKey('add_image'),
                onTap: add,
                child: ThumbnailButtonAdd(size: thumbSize),
              );
            }

            final fileId = filesId[i];
            return ThumbnailPicker(
              key: ValueKey(fileId),
              fileId: fileId,
              size: thumbSize,
              isCover: i == 0,
              onTap: () => showImageGallery(
                context,
                images: filesId,
                initialIndex: i,
                ownerId: id,
                ownerType: ownerType,
              ),
              dragHandle: filesId.length > 1 && uploaded(fileId)
                  ? ReorderableGridDragStartListener(
                      index: i,
                      child: const _DragHandle(),
                    )
                  : null,
            );
          },
        ),
        if (filesId.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            filesId.length > 1
                ? 'Glissez la poignée d\'une photo pour la déplacer ; la '
                      'première sert de couverture. Touchez une photo pour la '
                      'retoucher ou la légender.'
                : 'Touchez la photo pour la retoucher ou la légender.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  /// L'image saisie se soulève : plus grande, avec une ombre.
  static Widget _lifted(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        final t = Curves.easeOut.transform(animation.value);
        return Transform.scale(
          scale: 1 + 0.1 * t,
          child: Material(
            elevation: 8 * t,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            child: child,
          ),
        );
      },
    );
  }
}

/// La prise de l'image : une zone de 40 px, plus facile à saisir que l'icône.
class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return const MouseRegion(
      cursor: SystemMouseCursors.grab,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(4),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Padding(
                padding: EdgeInsets.all(3),
                child: Icon(Icons.drag_indicator, color: Colors.white, size: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
