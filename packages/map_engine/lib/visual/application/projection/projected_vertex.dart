import 'dart:ui';

import 'package:map_engine/visual/application/draw_command/draw_command_domain.dart';
import 'package:map_engine/visual/application/projection/base_objects/projected_object.dart';
import 'package:map_engine/visual/application/projection/map_paint_context.dart';
import 'package:map_engine/visual/domain/domain.dart';

enum VertexVisualKind { normal, start, end }

final class ProjectedVertex extends ProjectedPoint<MapVertex> {
  ProjectedVertex({
    required super.object,
    required super.worldPosition,
    this.visualKind = VertexVisualKind.normal,
  });
  final VertexVisualKind visualKind;

  @override
  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
  }) {
    final isSelected = context.state == MapObjectVisualState.selected;
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = isSelected ? const Color(0xFF2196F3) : const Color(0xFF219903);
    final selectionPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = isSelected ? const Color(0xFF2196F3) : const Color(0xFF219903);
    return <MapDrawCommand>[
      DrawTransform(
        transform: DrawTransformData(
          scale: isSelected ? 1.5 : 1.0,
          origin: worldPosition,
        ),
        commands: [
          DrawCircle(center: worldPosition, radius: 0.03, paint: paint),
          if (isSelected)
            DrawCircle(
              center: worldPosition,
              radius: 0.03,
              paint: selectionPaint,
            ),
        ],
      ),
    ];
  }
}
