import 'dart:ui';

import 'package:map_engine/domain/domain.dart';

abstract class MapPointerEvent {
  const MapPointerEvent();

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
