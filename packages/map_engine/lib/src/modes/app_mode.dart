// là où ZoomIn est visible (couche qui voit les commandes)
import 'package:map_engine/src/gesture_engine/gesture_engine.dart';
import 'package:map_engine/src/mode_engine/mode.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/commands/camera_command.dart';

import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/transition.dart';
import 'package:map_engine/src/modes/shared/overlays/context_menu.dart';

abstract class AppMode extends Mode {
  const AppMode();

  @override
  Transition onDoubleTap(DoubleTapGesture g) =>
      Transition.run(ZoomIn(g.position.screen));
  @override
  Transition onTap(TapGesture g) => Transition.overlay(g.tapMenu);
  @override
  Transition onDragEnd(DragEndGesture g) => Transition.overlay(g.dragEndMenu);
}
