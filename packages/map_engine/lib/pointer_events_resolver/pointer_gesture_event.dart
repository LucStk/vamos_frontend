import 'dart:ui';

import 'package:map_engine/domain/pointer_gesture_state.dart';
import 'package:map_engine/domain/projected_scene.dart';
import 'package:map_engine/pointer_events_resolver/pointer_gesture_action.dart';

sealed class MapPointerEvent {
  final Offset offset;
  const MapPointerEvent(this.offset);
}

class MapPointerDown extends MapPointerEvent {
  const MapPointerDown(super.offset);
}

class MapPointerMove extends MapPointerEvent {
  const MapPointerMove(super.offset);
}

class MapPointerUp extends MapPointerEvent {
  const MapPointerUp(super.offset);
}

class PointerEventsResolverContext {
  const PointerEventsResolverContext({
    required this.scene,
    required this.state,
  });

  /// Scène projetée au moment de l'événement.
  final ProjectedScene scene;

  /// État courant du gesture resolver.
  final PointerGestureState state;
}

class PointerEventResolution {
  const PointerEventResolution({required this.state, this.action});

  final PointerGestureState state;

  /// Action reconnue à transmettre au GesturesResolver.
  final PointerGestureAction? action;
}
