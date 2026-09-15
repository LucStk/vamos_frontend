import 'dart:ui';

import 'package:map_engine/map_engine.dart';

class PendingTap {
  const PendingTap({
    required this.element,
    required this.point,
    this.doubleTapMaxDistancePx = 24,
  });

  final MapObject? element;
  final Offset point;

  final double doubleTapMaxDistancePx;

  bool compare(MapObject? otherElement, Offset otherPoint) {
    if ((point - otherPoint).distance > doubleTapMaxDistancePx) {
      return false;
    }

    // Deux taps dans le vide = même cible.
    if (element == null && otherElement == null) {
      return true;
    }

    // Un seul des deux taps est sur un élément.
    if (element == null || otherElement == null) {
      return false;
    }

    return element!.isSameAs(otherElement);
  }
}
