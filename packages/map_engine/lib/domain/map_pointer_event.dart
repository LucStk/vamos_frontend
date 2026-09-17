import 'dart:ui';

import 'package:map_engine/domain/offset_type.dart';
import 'package:map_engine/domain/pointer_gesture_action.dart';
import 'package:map_engine/domain/pointer_gesture_state.dart';
import 'package:map_engine/domain/projected_scene.dart';
import 'package:map_engine/pointer_events_resolver/pointer_events_resolver.dart';

abstract class MapPointerEvent {
  final WorldOffset offset;
  final double scale;
  const MapPointerEvent(this.offset, this.scale);

  final double pointerTapSlopPx = 8;

  double distanceTo(Offset p1, Offset p2) => (p1 - p2).distance;

  PointerEventResolution resolve(PointerEventsResolverContext context);
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
