// objects/shared/badge/badge_style.dart
import 'dart:ui';

import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';

import 'badge_look.dart';

/// Pastille ronde (disque + liseré clair + halo) portant un glyphe.
///
/// Réutilisable par tout item qui affiche une icône sur la carte : mobilité,
/// résultats de recherche, POI...
///
/// Distinct de `SegmentLook` : `widthScale` s'applique à une épaisseur de
/// trait, pas à un rayon — le réutiliser ferait une pastille énorme à la
/// sélection.
abstract final class BadgeStyle {
  /// Valeurs interpolables par défaut. Composition dans l'ordre
  /// hovered → selected → dragging : à 1, le dernier trait actif l'emporte.
  /// Un item qui veut une autre dynamique définit son propre
  /// `StyleResolver<BadgeLook>` et le passe à la place de celui-ci.
  static const resolver = StyleResolver<BadgeLook>(
    base: BadgeLook(scale: 1.0, casing: 1.5, halo: 0, lift: 0),
    traits: {
      VisualTrait.hovered: BadgeLook(
        scale: 1.12,
        casing: 1.5,
        halo: 5,
        lift: 0.15,
      ),
      VisualTrait.selected: BadgeLook(scale: 1.2, casing: 2, halo: 12, lift: 0),
      VisualTrait.dragging: BadgeLook(
        scale: 1.15,
        casing: 2,
        halo: 16,
        lift: 0.2,
      ),
    },
  );

  static const _casingColor = Color(0xD9FFFFFF); // blanc ~85 %
  static const _white = Color(0xFFFFFFFF);

  /// Rayon par défaut de la pastille au repos (px).
  ///
  /// Les items qui font du hit-test (`visualRadius`) doivent lire cette
  /// valeur, ou le `radius` qu'ils passent à [build], plutôt que dupliquer
  /// la constante : les deux doivent rester égaux.
  static const defaultRadius = 11.0;

  /// Le glyphe garde la proportion d'origine (13 px pour un rayon de 11 px),
  /// quelle que soit la taille de la pastille.
  static const _glyphToRadius = 13.0 / 11.0;

  static DrawCommand build({
    required WorldOffset anchor,
    required Color color,
    required IconGlyph glyph,
    required BadgeLook look,
    double radius = defaultRadius,
  }) {
    final r = radius * look.scale;
    final fill = Color.lerp(color, _white, look.lift)!;

    // Arrondi : sans lui, chaque frame d'animation crée une entrée de cache
    // distincte dans GlyphPaths et le chemin est reparsé à 60 Hz.
    final glyphPx = (radius * _glyphToRadius * look.scale).roundToDouble();

    return DrawGroup([
      if (look.halo > 0.1)
        DrawCircle(
          center: anchor,
          radius: (r + look.halo / 2).px,
          style: Fill(color.withValues(alpha: 0.30)),
        ),
      DrawCircle(center: anchor, radius: r.px, style: Fill(_casingColor)),
      DrawCircle(
        center: anchor,
        radius: (r - look.casing).px,
        style: Fill(fill),
      ),
      DrawAnchoredPath(
        anchor: anchor,
        path: GlyphPaths.anchored(glyph, sizePx: glyphPx),
        style: glyphStyle(glyph, _white, sizePx: glyphPx),
      ),
    ]);
  }
}
