import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:vamos_cartographie/domain/domain.dart';
import 'package:vamos_cartographie/data/repositories/i_trip_repository.dart';
import '_trip_editor.dart';
import "../shared/dialog_shell.dart";
import "../shared/buttons.dart";

/// Dialog de création d'un nouveau voyage.
/// Affiche un TripInfoEditor sur un Trip vide.
/// À la confirmation : crée le voyage via le repository et retourne l'id.
class TripCreatorDialog extends StatelessWidget {
  final void Function(int tripId) onCreated;
  final VoidCallback onCancel;

  const TripCreatorDialog({
    super.key,
    required this.onCreated,
    required this.onCancel,
  });

  /// Affiche le dialog de création.
  static void show({
    required BuildContext context,
    required void Function(int tripId) onCreated,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => TripCreatorDialog(
        onCreated: onCreated,
        onCancel: () => Navigator.of(ctx).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final newTrip = Trip(waypoints: [], segments: []);
    final editorKey = GlobalKey<TripInfoEditorState>();

    return DialogShell(
      constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),
      content: Column(
        children: [
          // ── En-tête ──
          Text(
            'Nouveau voyage',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Divider(color: theme.colorScheme.outlineVariant),
          const SizedBox(height: 12),
          TripInfoEditor(key: editorKey, initialTrip: newTrip),
        ],
      ),
      buttonsBuilder: (ctx) => [
        CancelButton(onPressed: () => Navigator.pop(ctx)),
        const Spacer(),
        ConfirmButton(
          onPressed: () {
            final editedTrip = editorKey.currentState?.currentTrip;
            if (editedTrip != null) {
              _handleCreate(ctx, editedTrip);
            } else {
              debugPrint("TripCreatorDialog : editedTrip is Null ?");
              Navigator.of(ctx).pop();
            }
          },
        ),
      ],
    );
  }

  Future<void> _handleCreate(BuildContext context, Trip trip) async {
    final result = await getIt<ITripRepository>().createTrip(trip);
    if (!context.mounted) return;
    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur : ${failure.message}'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      (createdTrip) {
        Navigator.of(context).pop();
        onCreated(createdTrip.id ?? 0);
      },
    );
  }
}
