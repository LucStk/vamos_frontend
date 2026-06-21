import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/trips/presentation/widgets/widgets.dart';

import 'package:vamos_cartographie/features/shared/shared.dart';

class TripFormDialog extends ConsumerStatefulWidget {
  final TripDraft initialTrip;
  final Future<void> Function(WidgetRef ref, TripDraft trip) onSubmit;
  final String successMessage;

  const TripFormDialog({
    super.key,
    required this.initialTrip,
    required this.onSubmit,
    required this.successMessage,
  });

  @override
  ConsumerState<TripFormDialog> createState() => _TripFormDialogState();
}

class _TripFormDialogState extends ConsumerState<TripFormDialog> {
  final _editorKey = GlobalKey<TripInfoEditorState>();

  bool _isSaving = false;

  Future<void> _submit() async {
    final trip = _editorKey.currentState?.currentTrip;
    if (trip == null) return;

    setState(() {
      _isSaving = true;
    });

    try {
      await widget.onSubmit(ref, trip);

      if (!mounted) return;

      Navigator.of(context).pop();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(widget.successMessage)));
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
    return DialogShell(
      constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),

      content: TripInfoEditor(key: _editorKey, initialTrip: widget.initialTrip),

      buttonsBuilder: (ctx) => [
        CancelButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        const Spacer(),

        ConfirmButton(isLoading: _isSaving, onPressed: _submit),
      ],
    );
  }
}
