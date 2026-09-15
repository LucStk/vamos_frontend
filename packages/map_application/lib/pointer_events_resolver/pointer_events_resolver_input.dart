import 'dart:ui';

import 'package:map_application/map_application.dart';

import 'pending_tap.dart';

class PointerEventsResolverInput {
  const PointerEventsResolverInput({
    required this.event,
    required this.scene,
    required this.state,
    this.pressPoint,
    this.pendingTap,
  });

  /// Événement pointeur à résoudre.
  final MapPointerEvent event;

  /// Scène projetée au moment de l'événement.
  final ProjectedScene scene;

  /// État courant du gesture resolver.
  final GestureState state;

  /// Point de départ du geste courant.
  final Offset? pressPoint;

  /// Tap en attente d'une éventuelle confirmation en double-tap.
  final PendingTap? pendingTap;
}
