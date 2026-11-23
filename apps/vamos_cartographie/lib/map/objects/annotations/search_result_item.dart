import 'dart:ui';

import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';

import 'package:map_engine/map_engine.dart';

/// Le curseur : fin et précis, il se glisse au doigt.
///
/// - libre : une petite cible (anneau, point, quatre repères) ;
/// - sur la route ([onRoute]) : un anneau bleu plein, qui rappelle le crayon
///   accroché : le tracé peut démarrer ici.
final class SearchResultItem extends PointItem {
  SearchResultItem({
    required this.object,
    required this.worldPosition,
    this.onRoute = false,
  });

  @override
  final MapSearchResult object;

  @override
  final WorldOffset worldPosition;

  /// Le curseur repose sur la route, ou sur son départ / son arrivée.
  final bool onRoute;

  @override
  ScreenLength get visualRadius => (onRoute ? 9 : 7).px;

  /// Zone de saisie large pour un doigt, malgré un dessin fin.
  @override
  ScreenLength get hitRadius => 20.px;

  @override
  int get zIndex => ZIndex.handle;

  static const _free = Color(0xFF263238);
  static const _route = Color(0xFF1E88E5);
  static const _halo = Color(0xCCFFFFFF);

  /// Quatre repères autour de l'anneau, en px écran autour du point.
  static Path _ticks(double from, double to) => Path()
    ..moveTo(0, -from)
    ..lineTo(0, -to)
    ..moveTo(from, 0)
    ..lineTo(to, 0)
    ..moveTo(0, from)
    ..lineTo(0, to)
    ..moveTo(-from, 0)
    ..lineTo(-to, 0);

  /// Un trait blanc dessous pour que le curseur reste lisible sur tout fond.
  List<DrawCommand> _stroked(Color color, double width, double radius) => [
    DrawCircle(
      center: worldPosition,
      radius: radius.px,
      style: Stroke(_halo, width: (width + 2).px),
    ),
    DrawCircle(
      center: worldPosition,
      radius: radius.px,
      style: Stroke(color, width: width.px),
    ),
  ];

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) {
    if (onRoute) {
      return DrawGroup([
        ..._stroked(_route, 2, 9),
        DrawCircle(
          center: worldPosition,
          radius: 4.px,
          style: Fill(_route),
        ),
      ]);
    }

    final ticks = _ticks(10, 15);
    return DrawGroup([
      ..._stroked(_free, 1.25, 7),
      DrawAnchoredPath(
        anchor: worldPosition,
        path: ticks,
        style: Stroke(_halo, width: 3.25.px, cap: StrokeCap.round),
      ),
      DrawAnchoredPath(
        anchor: worldPosition,
        path: ticks,
        style: Stroke(_free, width: 1.25.px, cap: StrokeCap.round),
      ),
      DrawCircle(
        center: worldPosition,
        radius: 1.5.px,
        style: Fill(_free),
      ),
    ]);
  }
}
