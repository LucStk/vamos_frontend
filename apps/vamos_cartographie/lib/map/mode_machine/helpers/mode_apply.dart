import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode_machine/map_mode.dart';

@Dependencies([modeSelection, ModeMachine])
extension ModeApply on WidgetRef {
  void applyTransition(Transition<AppMode>? t) =>
      read(modeMachineProvider).apply(t);
}
