import 'dart:ui';
import 'package:map_engine/map_engine.dart';
import 'package:map_canvas/map_canvas.dart';

enum VertexVisualKind { normal, start, end }

final class ProjectedVertex extends ProjectedPoint<MapVertex> {
  ProjectedVertex({
    required super.object,
    required super.worldPosition,
    this.visualKind = VertexVisualKind.normal,
  });
  final VertexVisualKind visualKind;

  static const _colors = <MapObjectVisualState, Color>{
    MapObjectVisualState.normal: Color(0xFF219903),
    MapObjectVisualState.selected: Color(0xFF2196F3),
    MapObjectVisualState.hovered: Color(0xFFFFC107),
    MapObjectVisualState.dragging: Color(0xFFFF5722),
  };
  static const _scales = <MapObjectVisualState, double>{
    MapObjectVisualState.normal: 1.0,
    MapObjectVisualState.selected: 1.3,
    MapObjectVisualState.hovered: 1.15,
    MapObjectVisualState.dragging: 1.4,
  };
  static const _haloOpacity = <MapObjectVisualState, double>{
    MapObjectVisualState.normal: 0.0,
    MapObjectVisualState.selected: 1.0,
    MapObjectVisualState.hovered: 0.4,
    MapObjectVisualState.dragging: 1.0,
  };

  @override
  MapDrawCommand describe({MapPaintContext context = const MapPaintContext()}) {
    final color = Color.lerp(
      _colors[context.from],
      _colors[context.state],
      context.t,
    )!;
    final scale = lerpDouble(
      _scales[context.from]!,
      _scales[context.state]!,
      context.t,
    )!;
    final haloOpacity = lerpDouble(
      _haloOpacity[context.from]!,
      _haloOpacity[context.state]!,
      context.t,
    )!;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    final selectionPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color.withOpacity(haloOpacity);

    return ScreenScale([
      Transform(
        transform: DrawTransformData(scale: scale, origin: worldPosition),
        commands: [
          DrawCircle(center: worldPosition, radius: 7, paint: paint),
          DrawCircle(center: worldPosition, radius: 9, paint: selectionPaint),
        ],
      ),
    ]);
  }
}
