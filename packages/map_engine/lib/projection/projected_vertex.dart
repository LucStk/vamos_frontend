part of 'projected_object.dart';

enum VertexVisualKind { normal, start, end }

final class ProjectedVertex extends ProjectedPoint<MapVertex> {
  ProjectedVertex({
    required super.object,
    required super.camera,
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
          origin: projectedPosition,
        ),
        commands: [
          DrawCircle(center: projectedPosition, radius: 8, paint: paint),
          if (isSelected)
            DrawCircle(
              center: projectedPosition,
              radius: 8,
              paint: selectionPaint,
            ),
        ],
      ),
    ];
  }
}
