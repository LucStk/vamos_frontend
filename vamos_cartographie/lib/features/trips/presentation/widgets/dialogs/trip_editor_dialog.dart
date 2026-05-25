import "package:flutter_riverpod/flutter_riverpod.dart";
import "../editors/trip_editor.dart";
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/trips/presentation/providers/trips_providers.dart';
import 'package:vamos_cartographie/features/trips/domain/domain.dart';
import "package:vamos_cartographie/shared/widgets/buttons/buttons.dart";
import "package:vamos_cartographie/shared/widgets/dialog_shell.dart";

class TripEditorDialog extends ConsumerStatefulWidget {
  final int tripId;

  const TripEditorDialog({super.key, required this.tripId});

  static void show({required BuildContext context, required int tripId}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => TripEditorDialog(tripId: tripId),
    );
  }

  @override
  ConsumerState<TripEditorDialog> createState() => _TripEditorDialogState();
}

class _TripEditorDialogState extends ConsumerState<TripEditorDialog> {
  final _editorKey = GlobalKey<TripInfoEditorState>();

  bool _isSaving = false;

  Future<void> _saveTrip(Trip editedTrip) async {
    setState(() {
      _isSaving = true;
    });

    try {
      await ref
          .read(tripsProvider.notifier)
          .updateTrip(editedTrip.id!, editedTrip);

      ref.invalidate(tripProvider(editedTrip.id!));

      if (!mounted) return;

      Navigator.of(context).pop();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Voyage mis à jour')));
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final tripAsync = ref.watch(tripProvider(widget.tripId));

    return tripAsync.when(
      loading: () => const DialogLoadingBody(),

      error: (error, _) {
        return DialogErrorBody(errorMessage: error.toString());
      },

      data: (trip) {
        return DialogShell(
          constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),

          content: TripInfoEditor(key: _editorKey, initialTrip: trip),

          buttonsBuilder: (ctx) => [
            CancelButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            const Spacer(),

            ConfirmButton(
              isLoading: _isSaving,

              onPressed: () async {
                final edited = _editorKey.currentState?.currentTrip;

                if (edited == null) return;

                await _saveTrip(edited);
              },
            ),
          ],
        );
      },
    );
  }
}
