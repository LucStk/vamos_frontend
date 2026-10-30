import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/ui/trip/sheet/trip_selection_sheet.dart';

@Dependencies([modeSelection, ModeMachine])
class TripReadOnlyUi extends ConsumerWidget {
  const TripReadOnlyUi(this.mode, {super.key});

  final TripReadOnlyMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TripSelectionSheet(tripId: mode.tripId, canEdit: false);
  }
}
