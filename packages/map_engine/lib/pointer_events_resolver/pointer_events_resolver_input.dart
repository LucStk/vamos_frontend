import 'dart:ui';

import 'package:map_engine/domain/pointer_gesture_state.dart';
import 'package:map_engine/map_engine.dart';

import 'pending_tap.dart';

class PointerEventsResolverInput {
  const PointerEventsResolverInput({
    required this.event,
    required this.scene,
    required this.state,
  });

  /// Événement pointeur à résoudre.
  final MapPointerEvent event;

  /// Scène projetée au moment de l'événement.
  final ProjectedScene scene;

  /// État courant du gesture resolver.
  final PointerGestureState state;
}
