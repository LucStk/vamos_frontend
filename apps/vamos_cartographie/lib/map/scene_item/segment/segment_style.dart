import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

/// Apparence de base, indépendante de l'état visuel. Données pures, sans unité.
final class SegmentAppearance {
  const SegmentAppearance({required this.color, this.dash});

  final Color color;

  /// [trait, vide, trait, vide...] en pixels écran. `null` = trait plein.
  final List<double>? dash;

  static const fallback = SegmentAppearance(color: Color(0xFF9E9E9E));
}

/// Valeurs interpolables d'un segment dans un état donné (en px).
final class SegmentLook implements Lerpable<SegmentLook> {
  const SegmentLook({
    required this.width, // trait principal
    required this.casing, // liseré clair de chaque côté
    required this.halo, // épaisseur ajoutée pour le halo, 0 = aucun
    required this.lift, // 0..1 : éclaircissement vers le blanc
  });

  final double width, casing, halo, lift;

  @override
  SegmentLook lerp(SegmentLook o, double t) => SegmentLook(
    width: lerpDouble(width, o.width, t)!,
    casing: lerpDouble(casing, o.casing, t)!,
    halo: lerpDouble(halo, o.halo, t)!,
    lift: lerpDouble(lift, o.lift, t)!,
  );
}

abstract final class SegmentStyle {
  static const resolver = StyleResolver<SegmentLook>(_lookOf);

  static SegmentLook _lookOf(MapObjectVisualState s) => switch (s) {
    MapObjectVisualState.normal => const SegmentLook(
      width: 6.5,
      casing: 1.5,
      halo: 0,
      lift: 0,
    ),
    MapObjectVisualState.hovered => const SegmentLook(
      width: 5,
      casing: 1.5,
      halo: 5,
      lift: 0.15,
    ),
    MapObjectVisualState.selected => const SegmentLook(
      width: 9,
      casing: 2,
      halo: 12,
      lift: 0,
    ),
    MapObjectVisualState.dragging => const SegmentLook(
      width: 7,
      casing: 2,
      halo: 16,
      lift: 0.2,
    ),
  };

  static const _casingColor = Color(0xD9FFFFFF); // blanc ~85 %
  static const _white = Color(0xFFFFFFFF);

  /// Look résolu, plus données de base, donne les commandes de dessin.
  static DrawCommand build(Path path, SegmentAppearance a, SegmentLook look) {
    final dash = a.dash == null ? null : [for (final d in a.dash!) d.px];
    // Cap rond sur un pointillé : il "bave" quand l'épaisseur s'anime.
    final cap = dash == null ? StrokeCap.round : StrokeCap.butt;

    Stroke stroke(Color c, double w, {List<Length>? dash}) =>
        Stroke(c, width: w.px, dash: dash, cap: cap, join: StrokeJoin.round);

    final mainColor = Color.lerp(a.color, _white, look.lift)!;
    final outer = look.width + look.casing * 2;

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
        style: stroke(mainColor, look.width, dash: dash),
      ),
    ]);
  }
}
