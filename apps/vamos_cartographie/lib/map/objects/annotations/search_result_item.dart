import 'dart:ui';

import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';

import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/shared/pin/pin_shape.dart';
import 'package:vamos_cartographie/map/objects/shared/pin/pin_style.dart';

/// Le curseur : une goutte dont la pointe est sur le point visé, qu'elle
/// désigne au lieu de le recouvrir — on voit donc ce qu'on pointe pendant
/// qu'on le déplace au doigt.
///
/// - libre : une goutte sombre ;
/// - sur la route ([onRoute]) : la même en bleu, comme le crayon accroché —
///   le tracé peut démarrer ici.
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

  static const _radius = 9.0;

  @override
  ScreenLength get visualRadius => _radius.px;

  /// Zone de saisie large pour un doigt, malgré une goutte fine.
  @override
  ScreenLength get hitRadius => 20.px;

  @override
  int get zIndex => ZIndex.handle;

  static const _free = Color(0xFF263238);
  static const _route = Color(0xFF1E88E5);

  /// La goutte se touche sur toute sa longueur, de la pointe à la tête.
  @override
  bool isHitAt(WorldOffset p, double zoomScale) => PinShape.isHitAt(
    p,
    tip: worldPosition.value,
    headOffset: PinShape.head(_radius),
    zoomScale: zoomScale,
    hitRadius: hitRadius.toWorld(zoomScale),
  );

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => PinStyle.build(
    anchor: worldPosition,
    color: onRoute ? _route : _free,
    radius: _radius,
  );
}
