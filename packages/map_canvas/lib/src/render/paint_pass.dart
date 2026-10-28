import 'dart:ui';

import 'package:map_canvas/src/domain/length.dart';
import 'package:map_canvas/src/domain/paint_spec.dart';

/// État d'une passe de rendu : canvas, zoom, et pinceaux réutilisés
/// (évite les allocations à chaque frame pendant les animations).
final class PaintPass {
  /// Passe invariante au zoom : ne dessine que les commandes en WorldLength.
  /// Pas de zoomScale, donc impossible de convertir un ScreenLength par erreur.
  PaintPass.invariant(this.canvas) : zoomScale = null;

  /// Passe dépendante du zoom : ne dessine que les commandes contenant
  /// un ScreenLength.
  PaintPass.dependent(this.canvas, {required double this.zoomScale});

  final Canvas canvas;
  final double? zoomScale; // null = passe invariante

  bool get isDependent => zoomScale != null;

  // Pinceaux réutilisés. Chaque utilisateur règle tous les champs dont il se
  // sert avant de dessiner ; ne les gardez jamais d'un appel à l'autre.
  final Paint _specPaint = Paint();
  final Paint strokePaint = Paint();
  final Paint hatchPaint = Paint();

  /// Pinceau par défaut, jamais modifié : sert aux `saveLayer`.
  final Paint layerPaint = Paint();

  double toWorld(Length l) => switch (l) {
    ScreenLength(:final value) => value / zoomScale!,
    WorldLength(:final value) => value,
  };

  /// Règle le pinceau partagé d'après [spec] et le renvoie.
  Paint paintFor(PaintSpec spec) {
    _specPaint.color = spec.color;
    switch (spec) {
      case Fill():
        _specPaint.style = PaintingStyle.fill;
      case Stroke(:final width, :final cap, :final join):
        _specPaint
          ..style = PaintingStyle.stroke
          ..strokeWidth = toWorld(width)
          ..strokeCap = cap
          ..strokeJoin = join;
    }
    return _specPaint;
  }
}
