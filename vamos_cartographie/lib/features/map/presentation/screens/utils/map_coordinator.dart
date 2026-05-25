// features/map/presentation/screens/utils/map_coordinator.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/presentation/providers/map_state_provider.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';

class MapCoordinator {
  final BuildContext context;
  final WidgetRef ref;

  MapCoordinator({required this.context, required this.ref});

  MapStateNotifier get _notifier => ref.read(mapStateProvider.notifier);
  MapState get _state => ref.read(mapStateProvider);

  /// Gère le retour en arrière avec validation des données modifiées
  Future<void> handleBack(
    Trip trip,
    Future<void> Function(Trip) onSaveRequested,
  ) async {
    if (_state.isDirty && _state.mode != MapMode.observer) {
      final choice = await showDialog<String>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Modifications non enregistrées'),
          content: const Text('Voulez-vous sauvegarder avant de quitter ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop('discard'),
              child: const Text('Ignorer'),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop('cancel'),
              child: const Text('Annuler'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop('save'),
              child: const Text('Sauvegarder'),
            ),
          ],
        ),
      );

      if (choice == 'cancel' || choice == null) return;

      if (choice == 'save') {
        await onSaveRequested(trip);
      } else if (choice == 'discard') {
        if (_state.mode == MapMode.editRoute) _notifier.cancelEditRoute(trip);
        if (_state.mode == MapMode.addPoint) _notifier.cancelAddPoint(trip);
      }
    }

    if (context.mounted) Navigator.of(context).pop();
  }

  /// Ouvre la fiche d'information d'un Waypoint
  void showWaypointInfo(Waypoint waypoint) {
    WaypointViewerDialog.show(
      context: context,
      waypoint: waypoint,
      onEdit: () {}, // Implémentation future
    );
  }

  /// Ouvre les options d'édition d'un segment de trajet
  void showSegmentOptions(int segmentIndex, Trip trip) {
    final seg = trip.segments[segmentIndex];
    SegmentCard.show(
      context: context,
      segmentIndex: segmentIndex,
      trip: trip,
      onTypeChanged: (type) {
        seg.type = type;
        _notifier.setDirty(true);
      },
    );
  }

  /// Utilitaire pour afficher les messages flash à l'écran
  void showSnackBar({required String message, required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.redAccent : Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
