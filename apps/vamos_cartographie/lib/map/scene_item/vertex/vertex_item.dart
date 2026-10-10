import 'dart:ui';
import 'package:map_engine/map_engine.dart';
import 'package:map_canvas/map_canvas.dart';

import 'vertex_style.dart';

enum VertexVisualKind { normal, start, end }

final class VertexItem extends PointItem<MapVertex> {
  VertexItem({
    required super.object,
    required super.worldPosition,
    this.visualKind = VertexVisualKind.normal,
  });

  final VertexVisualKind visualKind;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => VertexStyle.build(
    worldPosition,
    VertexStyle.of(visualKind).resolve(context),
  );
}
