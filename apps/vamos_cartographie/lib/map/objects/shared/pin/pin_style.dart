import 'dart:ui';

import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/map/objects/shared/pin/pin_shape.dart';

/// Une goutte pleine, liseré clair, avec un point clair au cœur de la tête :
/// le repère des curseurs (position GPS, résultat de recherche).
///
/// Sa pointe est sur le point : elle le désigne sans le recouvrir. Pour une
/// goutte qui porte un glyphe, voir `WaypointItem`.
abstract final class PinStyle {
  /// Rayon de la tête, en px écran.
  static const defaultRadius = 9.0;

  /// Épaisseur du liseré clair, qui détache la goutte de la carte.
  static const _casing = 2.0;

  static const _casingColor = Color(0xF2FFFFFF);
  static const _dotColor = Color(0xFFFFFFFF);

  static DrawCommand build({
    required WorldOffset anchor,
    required Color color,
    double radius = defaultRadius,
    double direction = PinShape.upright,
  }) {
    final head = PinShape.head(radius, direction: direction);

    return DrawGroup([
      DrawAnchoredPath(
        anchor: anchor,
        path: PinShape.path(Offset.zero, head, radius),
        style: Fill(_casingColor),
      ),
      DrawAnchoredPath(
        anchor: anchor,
        path: PinShape.path(Offset.zero, head, radius - _casing),
        style: Fill(color),
      ),
      DrawAnchoredPath(
        anchor: anchor,
        path: Path()
          ..addOval(Rect.fromCircle(center: head, radius: radius / 3)),
        style: Fill(_dotColor),
      ),
    ]);
  }
}
