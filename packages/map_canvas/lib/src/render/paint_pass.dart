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

  /// La même longueur, en pixels écran : l'unité de [inScreenSpace].
  double toPx(Length l) => switch (l) {
    ScreenLength(:final value) => value,
    WorldLength(:final value) => value * zoomScale!,
  };

  /// Dessine [draw] autour de [anchor], avec 1 unité = 1 pixel écran.
  ///
  /// Une forme de quelques pixels n'a pas sa place en unités monde : à fort
  /// zoom, `9 px` vaut `9 / 32768` d'unité, à côté de coordonnées monde de
  /// l'ordre de 100. Skia travaille en float32 : les deux ne se distinguent
  /// plus, et la forme se quantifie — un cercle devient un polygone, un
  /// glyphe un escalier. On place donc l'origine sur l'ancre, puis on met à
  /// l'échelle, et la forme se dessine avec ses coordonnées en pixels.
  ///
  /// Deux opérations séparées, dans cet ordre : une seule matrice
  /// (`scale` + `translate`) additionnerait deux grands nombres de signes
  /// opposés et perdrait la précision qu'on vient de gagner. Même raison et
  /// même remède que le pointillé, voir `paintPath`.
  void inScreenSpace(Offset anchor, void Function() draw) {
    canvas.save();
    canvas.translate(anchor.dx, anchor.dy);
    canvas.scale(1 / zoomScale!);
    try {
      draw();
    } finally {
      canvas.restore();
    }
  }

  /// Le pinceau de [spec], épaisseur en pixels : pour [inScreenSpace].
  Paint pxPaintFor(PaintSpec spec) {
    final paint = paintFor(spec);
    if (spec case Stroke(:final width)) paint.strokeWidth = toPx(width);
    return paint;
  }

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
