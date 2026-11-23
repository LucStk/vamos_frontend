import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/application/stored_file_store.dart';
import 'package:stored_file_application/domain/stored_file_repository.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/injection/stored_file_provider.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/carousel_picker.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/carousel_view.dart';
import 'package:vamos_cartographie/domain_features/waypoint/waypoint.dart';
import 'package:vamos_cartographie/ui_kit/inputs/inline_editable_text.dart';

/// Page dépliée "Aperçu". TODO: y déplacer le contenu de ton
/// waypoint_viewer_content.dart actuel (description + galerie complète).
class WaypointOverviewViewer extends ConsumerWidget {
  const WaypointOverviewViewer({
    super.key,
    required this.tripId,
    required this.waypoint,
    this.editable = false,
  });

  final WaypointFields waypoint;
  final TripId tripId;
  final bool editable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final hasPhotos = ref.watch(
      storedFileStoreProvider.select(
        (s) => s.getFromOwner(waypoint.id).isNotEmpty,
      ),
    );
    final description = waypoint.description.trim();

    return Column(
      key: const ValueKey('full_content'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SectionTitle('Photos', theme: theme),
        const SizedBox(height: 8),

        if (editable)
          ImageCarouselPicker(
            id: waypoint.id,
            ownerType:
                TargetType.waypoint, // à adapter au nom réel de votre enum
          )
        else if (hasPhotos)
          ImageCarouselView(id: waypoint.id)
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
            style: const TextStyle(fontSize: 14, height: 1.5),
            onSave: (value) async {
              ref
                  .read(waypointStoreProvider(tripId).notifier)
                  .updateDescription(waypoint, value);
              return null;
            },
          )
        else if (description.isNotEmpty)
          Text(description, style: const TextStyle(fontSize: 14, height: 1.5))
        else
          _EmptyHint('Aucune description', theme: theme),

        if (editable) ...[
          const SizedBox(height: 20),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text("Fin d'étape"),
            subtitle: const Text(
              'Halte de nuit : la route est découpée en jours',
            ),
            value: waypoint.stay != null,
            onChanged: (on) => _setStay(context, ref, on),
          ),
        ],

        const SizedBox(height: 8),
      ],
    );
  }

  Future<void> _setStay(BuildContext context, WidgetRef ref, bool on) async {
    final editor = ref.read(waypointStoreProvider(tripId).notifier);
    if (on) {
      editor.setStay(waypoint.id, 1);
      return;
    }
    // Les notes des jours de la halte disparaissent avec elle.
    final hasNotes = waypoint.stay?.dayNotes.isNotEmpty ?? false;
    if (hasNotes && !await _confirmClearStay(context)) return;
    editor.clearStay(waypoint.id);
  }

  Future<bool> _confirmClearStay(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Retirer la fin d'étape ?"),
        content: const Text(
          'Les notes des journées de cette halte seront supprimées.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Retirer'),
          ),
        ],
      ),
    );
    return confirmed == true;
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
