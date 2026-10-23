import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/features/sketch/sheet/sketch_bottom_sheet.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/sheet/trip_selection_sheet.dart';

@Dependencies([modeSelection, ModeMachine])
class TripModeSheetUi extends ConsumerWidget {
  const TripModeSheetUi(this.mode, {super.key});

  final TripMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (mode) {
      TripReadOnlyMode e => TripSelectionSheet(
        tripId: e.tripId,
        canEdit: false,
      ),
      TripEditableMode m => switch (m) {
        TripActiveMode e => TripSelectionSheet(tripId: e.tripId, canEdit: true),
        SketchEdition _ => SketchBottomSheet(
          onTypeChanged: (_) {},
          stopSketch: () {},
        ),
        TripValidatingMode _ => SizedBox.shrink(),
        SketchCreation _ => SizedBox.shrink(),
        SketchMode _ => SizedBox.shrink(),
      },
    };
  }
}
