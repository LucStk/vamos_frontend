import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/map/objects/route/segment/appearance/segment_appearance.dart';
import 'package:vamos_cartographie/map/objects/route/segment/style/segment_look.dart';

abstract final class SegmentStyle {
  /// Largeur de base de référence (6.5 px) : sert à exprimer les ratios
  /// ci-dessous avec les valeurs d'origine. Doit rester égale à
  /// `SegmentItem.visualRadius * 2`.
  static const _base = 6.5;

  /// Composition dans l'ordre hovered → selected → dragging : à 1, le
  /// dernier trait actif l'emporte.
  static const resolver = StyleResolver<SegmentLook>(
    base: SegmentLook(widthScale: 0.7, casing: 1.5, halo: 0, lift: 0),
    traits: {
      VisualTrait.hovered: SegmentLook(
        widthScale: 5 / _base,
        casing: 1.5,
        halo: 5,
        lift: 0.15,
      ),
      VisualTrait.selected: SegmentLook(
        widthScale: 9 / _base,
        casing: 2,
        halo: 12,
        lift: 0,
      ),
      VisualTrait.dragging: SegmentLook(
        widthScale: 7 / _base,
        casing: 2,
        halo: 16,
        lift: 0.2,
      ),
    },
  );

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
