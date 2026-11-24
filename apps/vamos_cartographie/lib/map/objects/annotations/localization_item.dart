import 'dart:ui';

import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';

import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/shared/pin/pin_shape.dart';
import 'package:vamos_cartographie/map/objects/shared/pin/pin_style.dart';

/// Ma position : une goutte verte dont la pointe est sur la coordonnée, pour
/// la désigner au lieu de la recouvrir.
final class LocalizationItem extends PointItem {
  LocalizationItem({required this.object, required this.worldPosition});

  @override
  final MapLocalization object;

  @override
  final WorldOffset worldPosition;

  static const _radius = 9.0;
  static const _color = Color(0xFF219903);

  /// Rayon de la tête : ce qui compte pour ne pas recouvrir un voisin.
  @override
  final ScreenLength visualRadius = _radius.px;

  @override
  ScreenLength get hitRadius => 14.px;

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
    color: _color,
    radius: _radius,
  );
}
