// mode just après avoir créé un trip pour poser le premier point
import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/trip_origin_menu.dart';
import 'package:map_engine/src/mode_machine/slots/trip_origin_slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

mixin OriginPlacement on AppMode {
  @override
  Transition<AppMode> onTap(TapGesture g) => Transition.overlay<AppMode>(
    TripOriginMenu(),
  ).and(tripOriginSlot, TripOrigin(g.world));

  @override
  Transition<AppMode> onDragging(DragUpdateGesture g) =>
      Transition.set(tripOriginSlot, TripOrigin(g.world));

  @override
  Transition<AppMode> onDragEnd(DragEndGesture g) =>
      Transition.overlay(TripOriginMenu());
}
