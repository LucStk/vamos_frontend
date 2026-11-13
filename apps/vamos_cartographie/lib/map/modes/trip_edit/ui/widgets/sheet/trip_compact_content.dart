import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/injection/injection.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/thumbnail_view.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/widgets/header/trip_header.dart';
import 'package:vamos_cartographie/map/ui/chrome/floating_header_card.dart';

/// Aperçu au repos : une vignette, le titre, et ce qui reste à remplir.
class TripCompactContent extends ConsumerWidget {
  const TripCompactContent({
    super.key,
    required this.trip,
    this.editable = false,
  });

  final Trip trip;
  final bool editable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final fileIds = ref.watch(
      storedFileStoreProvider.select((s) => s.getFromOwner(trip.id)),
    );
    final hasDescription = trip.description.trim().isNotEmpty;

    final subtitle = switch ((fileIds.length, hasDescription)) {
      (0, false) when editable => 'Ajoutez une description et des photos',
      (0, false) => 'Aucune information',
      (0, true) => trip.description,
      (final n, false) => '$n photo${n > 1 ? 's' : ''}',
      (final n, true) => '$n photo${n > 1 ? 's' : ''} · ${trip.description}',
    };

    return Row(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
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
        ),
        SizedBox(
          width: 48,
          height: 48,
          child: fileIds.isEmpty
              ? _EmptyThumb(editable: editable)
              : ThumbnailView(
                  key: ValueKey(fileIds.first),
                  fileId: fileIds.first,
                  size: 48,
                ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                trip.title.isEmpty ? 'Voyage sans titre' : trip.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
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
