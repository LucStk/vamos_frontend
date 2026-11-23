import 'dart:math';
import 'dart:ui';

import 'package:domain_core/domain_core.dart';

import 'package:map_engine/map_engine.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/domain_features/waypoint/presentation/waypoint_kind_display.dart';
import 'package:vamos_cartographie/map/objects/shared/badge/badge_look.dart';
import 'package:vamos_cartographie/map/objects/shared/badge/badge_style.dart';

/// Un waypoint : une épingle dont la pointe est sur sa position géographique
/// (elle la désigne au lieu de la recouvrir), la tête portant le glyphe.
///
/// L'épingle pointe vers la route : [direction] est celle de la pointe vers la
/// tête, donc à l'opposé du point de la route le plus proche.
final class WaypointItem extends PointItem {
  WaypointItem({
    required this.object,
    required this.worldPosition,
    required this.kindStyle,
    this.background = false,
    this.direction = upright,
  }) : zIndex = background ? ZIndex.content - 1 : ZIndex.marker;

  /// Direction de la pointe vers la tête : droit vers le haut de l'écran.
  static const upright = -pi / 2;

  /// Direction de la pointe vers la tête (radians, repère de l'écran).
  final double direction;

  /// Au second plan : sous la route, presque transparent. Pour les scènes où
  /// les waypoints ne sont que du repère (sélection d'une portion de route).
  final bool background;

  /// Une copie de ce waypoint au second plan.
  WaypointItem asBackground() => WaypointItem(
    object: object,
    worldPosition: worldPosition,
    kindStyle: kindStyle,
    background: true,
    direction: direction,
  );

  /// Opacité d'un waypoint au second plan.
  static const _backgroundOpacity = 0.12;

  @override
  int zIndex;

  /// Un waypoint au second plan n'est qu'un repère : on ne le touche pas, les
  /// gestes passent à ce qu'il y a dessous.
  @override
  bool get isHitTestable => !background && super.isHitTestable;

  @override
  final MapWaypoint object;
  @override
  final WorldOffset worldPosition;

  /// Couleur et glyphe : même source que les widgets (catégorie ou halte).
  final WaypointKindStyle kindStyle;

  /// Rayon de la tête au repos.
  static const _radius = 13.0;

  /// Distance de la pointe au centre de la tête, en rayons.
  static const _tipRatio = 1.9;

  /// Proportion du glyphe, comme [BadgeStyle].
  static const _glyphToRadius = 13.0 / 11.0;

  static const _casingColor = Color(0xD9FFFFFF);
  static const _white = Color(0xFFFFFFFF);

  @override
  ScreenLength get visualRadius => _radius.px;

  @override
  ScreenLength get hitRadius => 16.px;

  /// Centre de la tête par rapport à la pointe, en px écran, au repos.
  Offset get _headOffset =>
      Offset(cos(direction), sin(direction)) * (_radius * _tipRatio);

  /// On touche l'épingle sur toute sa longueur : de la pointe à la tête.
  @override
  bool isHitAt(WorldOffset p, double zoomScale) {
    final tip = worldPosition.value;
    final head = tip + _headOffset / zoomScale;
    final ab = head - tip;
    final len2 = ab.dx * ab.dx + ab.dy * ab.dy;
    final ap = p.value - tip;
    final t = len2 == 0
        ? 0.0
        : ((ap.dx * ab.dx + ap.dy * ab.dy) / len2).clamp(0.0, 1.0);
    final nearest = tip + ab * t;
    return (p.value - nearest).distance <= hitRadius.toWorld(zoomScale);
  }

  static Color _fade(Color c, double opacity) =>
      opacity >= 1 ? c : c.withValues(alpha: c.a * opacity);

  /// L'épingle : un disque de rayon [r] centré en [head], prolongé par une
  /// pointe en [tip] (coordonnées px, y vers le bas).
  static Path _pin(Offset tip, Offset head, double r) {
    final toHead = head - tip;
    final d = toHead.distance;
    final phi = atan2(toHead.dy, toHead.dx);
    // Les points de tangence sont vus du centre à ±gamma de la direction de
    // la pointe.
    final gamma = acos((r / d).clamp(0.0, 1.0));
    final fromHeadToTip = phi + pi;
    Offset onCircle(double a) => head + Offset(cos(a), sin(a)) * r;

    return Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(
        onCircle(fromHeadToTip + gamma).dx,
        onCircle(fromHeadToTip + gamma).dy,
      )
      ..arcTo(
        Rect.fromCircle(center: head, radius: r),
        fromHeadToTip + gamma,
        2 * pi - 2 * gamma,
        false,
      )
      ..close();
  }

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) {
    final resolved = BadgeStyle.resolver.resolve(context);
    final look = background
        ? BadgeLook(
            scale: resolved.scale,
            casing: resolved.casing,
            halo: resolved.halo,
            lift: resolved.lift,
            opacity: min(resolved.opacity, _backgroundOpacity),
          )
        : resolved;

    final r = _radius * look.scale;
    final head = Offset(cos(direction), sin(direction)) * (r * _tipRatio);
    final o = look.opacity;
    final color = kindStyle.color;
    final fill = _fade(Color.lerp(color, _white, look.lift)!, o);
    final glyphPx = (_radius * _glyphToRadius * look.scale).roundToDouble();

    return DrawGroup([
      if (look.halo > 0.1)
        DrawAnchoredPath(
          anchor: worldPosition,
          path: Path()
            ..addOval(Rect.fromCircle(center: head, radius: r + look.halo / 2)),
          style: Fill(_fade(color.withValues(alpha: 0.30), o)),
        ),
      DrawAnchoredPath(
        anchor: worldPosition,
        path: _pin(Offset.zero, head, r),
        style: Fill(_fade(_casingColor, o)),
      ),
      DrawAnchoredPath(
        anchor: worldPosition,
        path: _pin(Offset.zero, head, r - look.casing),
        style: Fill(fill),
      ),
      DrawAnchoredPath(
        anchor: worldPosition,
        path: GlyphPaths.anchored(
          IconGlyph(kindStyle.svgPath),
          sizePx: glyphPx,
        ).shift(head),
        style: glyphStyle(
          IconGlyph(kindStyle.svgPath),
          _fade(_white, o),
          sizePx: glyphPx,
        ),
      ),
    ]);
  }
}
