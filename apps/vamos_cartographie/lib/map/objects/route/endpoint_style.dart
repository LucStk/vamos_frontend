// route/endpoint_style.dart
import 'dart:ui';

import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';

/// Les deux bouts de la route. Ils ne se ressemblent pas : une cible pour le
/// départ, un drapeau à damier pour l'arrivée — reconnaissables du premier
/// coup d'œil, même au bout d'un tracé chargé.
///
/// Les deux portent un liseré blanc, pour rester lisibles sur n'importe quel
/// fond de carte, et se placent exactement sur leur coordonnée (la pointe du
/// mât pour le drapeau).
abstract final class EndpointStyle {
  static const _green = Color(0xFF2E7D32);
  static const _dark = Color(0xFF263238);
  static const _white = Color(0xFFFFFFFF);

  /// Rayon de la cible du départ, en px écran.
  static const _startRadius = 10.0;

  /// Hauteur du drapeau d'arrivée, en px écran.
  static const _flagPx = 30.0;

  /// Départ : une cible. Disque vert, liseré blanc, anneau blanc au cœur.
  static DrawCommand start(WorldOffset at) => DrawGroup([
    DrawCircle(center: at, radius: _startRadius.px, style: Fill(_white)),
    DrawCircle(
      center: at,
      radius: (_startRadius - 2).px,
      style: Fill(_green),
    ),
    DrawCircle(
      center: at,
      radius: (_startRadius - 5.5).px,
      style: Stroke(_white, width: 2.px),
    ),
  ]);

  /// Arrivée : un drapeau à damier, le pied de son mât sur la coordonnée.
  static DrawCommand end(WorldOffset at) => DrawGroup([
    // Silhouette blanche : elle sert de fond aux cases claires du damier et,
    // débordant un peu, détache le drapeau de la carte.
    DrawAnchoredPath(
      anchor: at,
      path: GlyphPaths.anchored(_silhouette, sizePx: _flagPx),
      style: Stroke(
        _white,
        width: 3.px,
        join: StrokeJoin.round,
        cap: StrokeCap.round,
      ),
    ),
    DrawAnchoredPath(
      anchor: at,
      path: GlyphPaths.anchored(_silhouette, sizePx: _flagPx),
      style: Fill(_white),
    ),
    DrawAnchoredPath(
      anchor: at,
      path: GlyphPaths.anchored(_checker, sizePx: _flagPx),
      style: Fill(_dark),
    ),
    // Le point lui-même, au pied du mât.
    DrawCircle(center: at, radius: 3.px, style: Fill(_dark)),
  ]);

  /// Mât et voile, d'un seul tenant : le fond du drapeau.
  static const _silhouette = IconGlyph(
    'M4 2h2v20H4z M6 3h14v10H6z',
    anchor: Offset(5, 22), // pied du mât
  );

  /// Le même dessin, les cases claires évidées (`evenOdd`) : il ne reste que
  /// le mât et les cases sombres du damier.
  static const _checker = IconGlyph(
    'M4 2h2v20H4z M6 3h14v10H6z '
    'M6 3h3.5v3.3333H6z M13 3h3.5v3.3333H13z '
    'M9.5 6.3333h3.5v3.3334H9.5z M16.5 6.3333h3.5v3.3334H16.5z '
    'M6 9.6667h3.5v3.3333H6z M13 9.6667h3.5v3.3333H13z',
    anchor: Offset(5, 22),
    fillType: PathFillType.evenOdd,
  );
}
