import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';

extension ModeApply on WidgetRef {
  void applyTransition(Transition<AppMode>? t) =>
      read(modeMachineProvider).apply(t);
}
