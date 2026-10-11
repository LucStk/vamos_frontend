import 'package:map_engine/map_engine.dart';
import 'package:map_canvas/map_canvas.dart';

import 'vertex_style.dart';

final class VertexItem extends PointItem {
  VertexItem({
    required this.object,
    required this.worldPosition,
    this.visualKind = VertexVisualKind.normal,
  });

  @override
  final MapVertex object;
  @override
  final WorldOffset worldPosition;
  final VertexVisualKind visualKind;

  /// Rayon du disque affiché (avant `look.scale`).
  @override
  final ScreenLength visualRadius = 9.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => VertexStyle.build(
    worldPosition,
    VertexStyle.of(visualKind).resolve(context),
    radius: visualRadius,
  );
}
