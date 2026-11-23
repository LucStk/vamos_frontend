import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import '/domain_features/stored_file/injection/injection.dart';
import 'package:vamos_cartographie/app_services/app_services.dart';
import 'widgets/widgets.dart';
import "thumbnail_picker.dart";

/// Les images d'un propriétaire, à ajouter, supprimer et **ordonner** : un
/// appui long sur une image la détache, qu'on dépose avant une autre (ou après
/// la dernière, sur le bouton d'ajout). La première sert de couverture.
class ImageCarouselPicker<T> extends ConsumerWidget {
  final Id<T> id;
  final TargetType ownerType;
  final double thumbSize = 80;
  const ImageCarouselPicker({
    super.key,
    required this.id,
    required this.ownerType,
  });

  /// [ids] où [dragged] est replacé juste avant [before] (à la fin si null).
  static List<StoredFileId> moved(
    List<StoredFileId> ids,
    StoredFileId dragged,
    StoredFileId? before,
  ) {
    final list = [...ids]..remove(dragged);
    final at = before == null ? list.length : list.indexOf(before);
    list.insert(at < 0 ? list.length : at, dragged);
    return list;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(storedFileStoreProvider);
    final notifier = ref.watch(storedFileStoreProvider.notifier);
    final filesId = store.getFromOwner(id);

    void drop(StoredFileId dragged, StoredFileId? before) {
      if (dragged == before) return;
      final next = moved(filesId, dragged, before);
      if (next.indexed.every((e) => e.$2 == filesId[e.$1])) return;
      notifier.reorderFiles(
        targetId: id,
        targetType: ownerType,
        orderedIds: next,
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final fId in filesId)
          _DraggableThumb(
            fileId: fId,
            size: thumbSize,
            onDrop: (dragged) => drop(dragged, fId),
          ),

        // Déposer ici : en dernier.
        DragTarget<StoredFileId>(
          onWillAcceptWithDetails: (_) => true,
          onAcceptWithDetails: (d) => drop(d.data, null),
          builder: (context, candidates, _) => GestureDetector(
            onTap: () async {
              final listFile = await pickImages();
              for (final file in listFile) {
                notifier.uploadFile(
                  file: file,
                  targetId: id,
                  targetType: ownerType,
                );
              }
            },
            child: ThumbnailButtonAdd(size: thumbSize),
          ),
        ),
      ],
    );
  }
}

/// Une image qu'on peut saisir (appui long) et sur laquelle on peut en
/// déposer une autre : elle passe alors devant.
class _DraggableThumb extends ConsumerWidget {
  const _DraggableThumb({
    required this.fileId,
    required this.size,
    required this.onDrop,
  });

  final StoredFileId fileId;
  final double size;
  final ValueChanged<StoredFileId> onDrop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Une image en cours d'envoi n'existe pas encore côté serveur.
    final uploaded = !ref.watch(
      storedFileNodeProvider(fileId).select((n) => n.isPendingCreation),
    );
    final thumb = ThumbnailPicker(fileId: fileId, size: size);
    final scheme = Theme.of(context).colorScheme;

    return DragTarget<StoredFileId>(
      onWillAcceptWithDetails: (d) => d.data != fileId,
      onAcceptWithDetails: (d) => onDrop(d.data),
      builder: (context, candidates, _) => Stack(
        clipBehavior: Clip.none,
        children: [
          LongPressDraggable<StoredFileId>(
            data: fileId,
            maxSimultaneousDrags: uploaded ? 1 : 0,
            delay: const Duration(milliseconds: 180),
            feedback: Material(
              elevation: 6,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              child: Opacity(opacity: 0.9, child: thumb),
            ),
            childWhenDragging: Opacity(opacity: 0.3, child: thumb),
            child: thumb,
          ),
          // Repère d'insertion : la place que prendra l'image déposée.
          if (candidates.isNotEmpty)
            Positioned(
              left: -6,
              top: 0,
              bottom: 0,
              child: Container(
                width: 3,
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
