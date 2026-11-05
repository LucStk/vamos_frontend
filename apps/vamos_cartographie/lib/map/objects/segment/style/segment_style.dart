import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';

/// Apparence de base, indépendante de l'état visuel. Données pures, sans unité.
final class SegmentAppearance {
  const SegmentAppearance({required this.color, this.dash});

  final Color color;

  /// [trait, vide, trait, vide...] en pixels écran. `null` = trait plein.
  final List<double>? dash;

  static const fallback = SegmentAppearance(color: Color(0xFF9E9E9E));
}

/// Valeurs interpolables d'un segment dans un état donné.
final class SegmentLook implements Lerpable<SegmentLook> {
  const SegmentLook({
    required this.widthScale,
    required this.casing,
    required this.halo,
    required this.lift,
  });

  /// Multiplicateur de la largeur de base (`visualRadius * 2`).
  final double widthScale;

  /// Liseré clair de chaque côté (px).
  final double casing;

  /// Épaisseur ajoutée pour le halo (px), 0 = aucun.
  final double halo;

  /// 0..1 : éclaircissement vers le blanc.
  final double lift;

  @override
  SegmentLook lerp(SegmentLook o, double t) => SegmentLook(
    widthScale: lerpDouble(widthScale, o.widthScale, t)!,
    casing: lerpDouble(casing, o.casing, t)!,
    halo: lerpDouble(halo, o.halo, t)!,
    lift: lerpDouble(lift, o.lift, t)!,
  );
}

abstract final class SegmentStyle {
  static const resolver = StyleResolver<SegmentLook>(_lookOf);

  /// Largeur de base de référence (6.5 px) : sert à exprimer les ratios
  /// ci-dessous avec les valeurs d'origine. Doit rester égale à
  /// `SegmentItem.visualRadius * 2`.
  static const _base = 6.5;

  static SegmentLook _lookOf(MapObjectVisualState s) => switch (s) {
    MapObjectVisualState.normal => const SegmentLook(
      widthScale: 1.0,
      casing: 1.5,
      halo: 0,
      lift: 0,
    ),
    MapObjectVisualState.hovered => const SegmentLook(
      widthScale: 5 / _base,
      casing: 1.5,
      halo: 5,
      lift: 0.15,
    ),
    MapObjectVisualState.selected => const SegmentLook(
      widthScale: 9 / _base,
      casing: 2,
      halo: 12,
      lift: 0,
    ),
    MapObjectVisualState.dragging => const SegmentLook(
      widthScale: 7 / _base,
      casing: 2,
      halo: 16,
      lift: 0.2,
    ),
  };

  static const _casingColor = Color(0xD9FFFFFF); // blanc ~85 %
  static const _white = Color(0xFFFFFFFF);

  /// Look résolu, plus données de base, donne les commandes de dessin.
  static DrawCommand build(
    Path path,
    SegmentAppearance a,
    SegmentLook look, {
    required ScreenLength radius,
  }) {
    final dash = a.dash == null ? null : [for (final d in a.dash!) d.px];
    // Cap rond sur un pointillé : il "bave" quand l'épaisseur s'anime.
    final cap = dash == null ? StrokeCap.round : StrokeCap.butt;

    Stroke stroke(Color c, double w, {List<Length>? dash}) =>
        Stroke(c, width: w.px, dash: dash, cap: cap, join: StrokeJoin.round);

    final mainColor = Color.lerp(a.color, _white, look.lift)!;
    final width = radius.value * 2 * look.widthScale;
    final outer = width + look.casing * 2;

    return DrawGroup([
      // Halo : toujours plein, même pour un segment pointillé.
      if (look.halo > 0.1)
        DrawPath(
          path: path,
          style: stroke(a.color.withValues(alpha: 0.30), outer + look.halo),
        ),
      // Liseré : pointillé aussi, sinon il comblerait les vides.
      DrawPath(
        path: path,
        style: stroke(_casingColor, outer, dash: dash),
      ),
      DrawPath(
        path: path,
        style: stroke(mainColor, width, dash: dash),
      ),
    ]);
  }
}
