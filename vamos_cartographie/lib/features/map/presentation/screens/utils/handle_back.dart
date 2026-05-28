// features/map/presentation/screens/utils/map_coordinator.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/presentation/screens/widgets/handle_back_dialog.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/map/presentation/providers/map_notifier.dart';

/// Gère le retour en arrière avec validation des données modifiées
Future<void> handleBack(BuildContext context, WidgetRef ref, int tripId) async {
  final mapState = ref.watch(mapStateProvider(tripId));
  if (mapState.isDirty) {
    HandleBackDialog.show(
      context: context,
      onCancel: () {},
      onIgnore: () {
        Navigator.pop(context);
      },
      onSave: () {
        throw Exception("Implémenter onSave de HandleBackDialog");
        if (context.mounted) Navigator.of(context).pop();
      },
    );
  }
}
