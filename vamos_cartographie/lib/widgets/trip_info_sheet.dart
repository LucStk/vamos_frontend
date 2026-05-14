import 'package:flutter/material.dart';
import '../models.dart';
import 'trip_info/trip_info_dialog.dart';

export 'trip_info/trip_info_view.dart';
export 'trip_info/editor/trip_info_editor.dart';

/// Point d'entrée unique pour afficher les infos du voyage.
/// Délègue à [TripInfoDialog] selon le mode.
class TripInfoSheet {
  static void show({
    required BuildContext context,
    required Trip trip,
    required VoidCallback onChanged,
    bool readOnly = false,
  }) {
    TripInfoDialog.show(
      context: context,
      trip: trip,
      onChanged: onChanged,
      readOnly: readOnly,
    );
  }
}
