import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/injection/injection.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/carousel_lightbox.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/thumbnail_view.dart';
// TODO: adapter le chemin vers ton widget LightBox.
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/widgets/header/trip_header.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_bottom_sheet_shell.dart';

import 'trip_stats.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Page 1 : titre + galerie
// ─────────────────────────────────────────────────────────────────────────────

class TripOverviewCompact extends ConsumerWidget {
  const TripOverviewCompact({
    super.key,
    required this.trip,
    this.editable = false,
  });

  final Trip trip;
  final bool editable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileIds = ref
        .watch(storedFileStoreProvider.select((s) => s.getFromOwner(trip.id)))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TripHeader(
                title: trip.title,
                canEdit: editable,
                onRename: (newTitle) async {
                  ref
                      .read(tripStoreProvider.notifier)
                      .updateTrip(trip.copyWith(title: newTitle));
                  return null;
                },
              ),
            ),
            const SheetExpandButton(),
          ],
        ),
        const Spacer(),
        _TripPhotoStrip(fileIds: fileIds, editable: editable),
      ],
    );
  }
}

/// Rangée de vignettes **non scrollable**.
///
/// Une galerie horizontale scrollable à l'intérieur du PageView entrerait en
/// conflit avec le swipe entre les pages (même axe). On affiche donc autant de
/// vignettes que la largeur le permet, et la dernière devient "+N". La galerie
/// complète vit dans le contenu déplié.
class _TripPhotoStrip extends ConsumerWidget {
  const _TripPhotoStrip({required this.fileIds, required this.editable});

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
              child: _EmptyThumb(editable: editable),
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
                  child: _MoreTile(count: hidden, size: _size),
                ),
            ],
          );
        },
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

class _EmptyThumb extends StatelessWidget {
  const _EmptyThumb({required this.editable});

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

// ─────────────────────────────────────────────────────────────────────────────
// Page 2 : informations numériques
// ─────────────────────────────────────────────────────────────────────────────

class TripStatsCompact extends StatelessWidget {
  const TripStatsCompact({super.key, required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final stats = tripStatsOf(trip).take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('Statistiques', style: theme.textTheme.titleSmall),
            ),
            const SheetExpandButton(),
          ],
        ),
        const SizedBox(height: 4),
        Expanded(
          child: Row(
            children: [
              for (var i = 0; i < stats.length; i++) ...[
                if (i > 0) const SizedBox(width: 8),
                Expanded(child: _StatTile(stat: stats[i])),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.stat});

  final TripStat stat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(stat.icon, size: 18, color: scheme.primary),
          const SizedBox(height: 4),
          Text(
            stat.value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleSmall,
          ),
          Text(
            stat.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
