import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/injection/injection.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/carousel_picker.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/carousel_view.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/ui_kit/inputs/inline_editable_text.dart';
import 'package:vamos_cartographie/ui_kit/theme/theme.dart';

/// Page dépliée "Aperçu". TODO: y déplacer le contenu de ton
/// trip_viewer_content.dart actuel (description + galerie complète).
class TripOverviewViewer extends ConsumerWidget {
  const TripOverviewViewer({
    super.key,
    required this.trip,
    this.editable = false,
  });

  final Trip trip;
  final bool editable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final photoCount = ref.watch(
      storedFileStoreProvider.select((s) => s.getFromOwner(trip.id).length),
    );
    final hasPhotos = photoCount > 0;
    final description = trip.description.trim();

    return Column(
      key: const ValueKey('full_content'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SectionTitle('Photos', theme: theme),
        const SizedBox(height: 8),

        if (editable)
          ImageCarouselPicker(
            id: trip.id,
            ownerType: TargetType.trip, // à adapter au nom réel de votre enum
          )
        else if (hasPhotos)
          ImageCarouselView(id: trip.id)
        else
          _EmptyHint('Aucune photo', theme: theme),

        const SizedBox(height: 20),
        _SectionTitle('Description', theme: theme),
        const SizedBox(height: 8),

        if (editable)
          InlineEditableText(
            text: description.isEmpty ? '' : description,
            canEdit: true,
            multiline: true,
            maxLength: 1000,
            expand: true,
            placeholder: 'Ajoutez une description…',
            style: theme.textTheme.prose,
            onSave: (value) async {
              ref
                  .read(tripStoreProvider.notifier)
                  .updateTrip(trip.copyWith(description: value));
              return null;
            },
          )
        else if (description.isNotEmpty)
          Text(description, style: theme.textTheme.prose)
        else
          _EmptyHint('Aucune description', theme: theme),

        const SizedBox(height: 8),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.label, {required this.theme});

  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerLeft,
    child: Text(
      label,
      style: theme.textTheme.labelLarge?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    ),
  );
}

class _EmptyHint extends StatelessWidget {
  const _EmptyHint(this.label, {required this.theme});

  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerLeft,
    child: Text(
      label,
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}
