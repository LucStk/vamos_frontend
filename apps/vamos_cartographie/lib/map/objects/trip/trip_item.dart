import 'dart:ui';

import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/trip/style/trip_style.dart';

final class TripItem extends LineItem {
  TripItem({
    required this.object,
    required this.worldSegments,
    this.color,
    this.dimmed = false,
  });

  @override
  final MapTrip object;

  @override
  final List<WorldSegment> worldSegments;

  /// Couleur propre au voyage. `null` : le bleu-gris du style par défaut.
  final Color? color;

  /// Effacé parce qu'un autre voyage est mis en avant.
  final bool dimmed;

  /// Demi-largeur du contour au repos (avant `look.widthScale`).
  @override
  ScreenLength get visualRadius => 2.25.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => TripStyle.build(
    path,
    TripStyle.resolver.resolve(context),
    radius: visualRadius,
    color: color,
    opacity: dimmed ? _dimmedOpacity : 1,
  );

  /// Assez pâle pour que le voyage en avant se détache, assez visible pour
  /// qu'on puisse encore viser un autre tracé.
  static const _dimmedOpacity = 0.3;
}
