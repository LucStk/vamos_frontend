import 'package:flutter/material.dart';
import '../../core/injection.dart';

import 'package:vamos_cartographie/domain/domain.dart';

import '../../data/repositories/i_trip_repository.dart';
import 'trip_info_dialog.dart';
import 'trip_info_view.dart';

/// Dialog de prévisualisation d'un voyage depuis l'ExplorerPage.
///
/// Charge le [Trip] complet (imageUrls, waypoints…) avant d'afficher,
/// puis propose : Retour · Modifier · Explorer.
class TripPreviewDialog extends StatefulWidget {
  final Trip tripData;
  final VoidCallback onEdit;
  final VoidCallback onExplore;

  const TripPreviewDialog({
    super.key,
    required this.tripData,
    required this.onEdit,
    required this.onExplore,
  });

  /// Affiche le dialog de prévisualisation.
  static void show({
    required BuildContext context,
    required Trip tripData,
    required VoidCallback onEdit,
    required VoidCallback onExplore,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => TripPreviewDialog(
        tripData: tripData,
        onEdit: onEdit,
        onExplore: onExplore,
      ),
    );
  }

  @override
  State<TripPreviewDialog> createState() => _TripPreviewDialogState();
}

class _TripPreviewDialogState extends State<TripPreviewDialog> {
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

  @override
  Widget build(BuildContext context) {
    // ── Chargement ──
    if (_trip == null && _error == null) {
      return const Dialog(
        child: Padding(
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

    // ── Erreur ──
    if (_error != null) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 48,
                color: Colors.redAccent,
              ),
              const SizedBox(height: 12),
              Text('Erreur : $_error', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Fermer'),
              ),
            ],
          ),
        ),
      );
    }

    // ── Contenu ──
    return TripInfoDialogShell(
      content: TripInfoView(trip: _trip!),
      actions: [
        // // Retour
        // TextButton(
        //   onPressed: () => Navigator.of(context).pop(),
        //   child: const Text('Retour'),
        // ),
        // Modifier
        OutlinedButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
            widget.onEdit();
          },
          icon: const Icon(Icons.edit_outlined, size: 16),
          label: const Text('Modifier'),
        ),
        const SizedBox(width: 8),
        // Explorer
        FilledButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
            widget.onExplore();
          },
          icon: const Icon(Icons.map_outlined, size: 16),
          label: const Text('Explorer'),
        ),
      ],
    );
  }
}
