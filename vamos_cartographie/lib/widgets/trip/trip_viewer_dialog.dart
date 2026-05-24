import 'package:flutter/material.dart';
import '../../core/injection.dart';
import 'package:vamos_cartographie/domain/domain.dart';
import '../../data/repositories/i_trip_repository.dart';
import '../shared/dialog_shell.dart';
import '../shared/buttons.dart';
import '_trip_info_view.dart';
import '_trip_editor.dart';

/// Dialog de prévisualisation d'un voyage depuis l'ExplorerPage.
///
/// Charge le [Trip] complet (imageUrls, waypoints…) avant d'afficher,
/// puis propose : Modifier · Explorer.
class TripViewerDialog extends StatefulWidget {
  final Trip tripData;
  final VoidCallback onExplore;

  const TripViewerDialog({
    super.key,
    required this.tripData,
    required this.onExplore,
  });

  /// Affiche le dialog de prévisualisation.
  static void show({
    required BuildContext context,
    required Trip tripData,
    required VoidCallback onExplore,
  }) {
    showDialog(
      context: context,
      builder: (ctx) =>
          TripViewerDialog(tripData: tripData, onExplore: onExplore),
    );
  }

  @override
  State<TripViewerDialog> createState() => _TripPreviewDialogState();
}

class _TripPreviewDialogState extends State<TripViewerDialog> {
  Trip? _trip;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadTrip();
  }

  Future<void> _loadTrip() async {
    final result = await getIt<ITripRepository>().getTrip(widget.tripData.id!);

    if (!mounted) return;

    result.fold(
      (failure) => setState(() => _error = failure.message),
      (trip) => setState(() => _trip = trip),
    );
  }

  Future<void> _upload(BuildContext context, Trip trip) async {
    final saveResult = await getIt<ITripRepository>().updateTrip(
      trip.id!,
      trip,
    );

    if (!context.mounted) return;

    saveResult.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur : ${failure.message}'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      (_) {
        Navigator.of(context).pop();
      },
    );
  }

  static void _showEditor({
    required BuildContext context,
    required Trip trip,
  }) async {
    final editorKey = GlobalKey<TripInfoEditorState>();

    final Trip? result = await showDialog<Trip>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => DialogShell(
        constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),
        content: TripInfoEditor(trip: trip),
        buttonsBuilder: (ctx) => [
          CancelButton(onPressed: () => Navigator.pop(ctx)),
          const Spacer(),
          ConfirmButton(onPressed: (){
            final editedTrip = editorKey.currentState?.currentTrip

          },)
        ],
      ),
    );
  }

  Widget _showError(BuildContext context) {
    return DialogShell(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
          const SizedBox(height: 12),
          Text('Erreur : $_error', textAlign: TextAlign.center),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  Widget _showLoading(BuildContext context) {
    return const DialogShell(
      content: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Chargement…'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ── Chargement ──
    if (_trip == null && _error == null) {
      return _showLoading(context);
    }

    // ── Erreur ──
    if (_error != null) {
      return _showError(context);
    }
    // ── Contenu ──
    return DialogShell(
      content: TripInfoView(trip: _trip!),
      buttonsBuilder: (ctx) => [
        ModifierButton(
          onPressed: () {
            _showEditor(context: context, trip: _trip!);
          },
        ),

        const SizedBox(width: 8),

        ExploreButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.onExplore();
          },
        ),
      ],
    );
  }
}
