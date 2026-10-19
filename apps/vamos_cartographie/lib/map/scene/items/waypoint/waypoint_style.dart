import 'dart:ui';

import 'package:domain_core/space/offset_type.dart';
import 'package:map_canvas/map_canvas.dart';

enum VertexVisualKind { normal, start, end }

final class VertexLook implements Lerpable<VertexLook> {
  const VertexLook({
    required this.color,
    required this.scale,
    required this.haloOpacity,
  });
  final Color color;
  final double scale, haloOpacity;

  @override
  VertexLook lerp(VertexLook o, double t) => VertexLook(
    color: Color.lerp(color, o.color, t)!,
    scale: lerpDouble(scale, o.scale, t)!,
    haloOpacity: lerpDouble(haloOpacity, o.haloOpacity, t)!,
  );
}

abstract final class VertexStyle {
  /// Écart entre le disque plein et l'anneau de halo.
  static const haloGap = 1.0;

  /// Point d'extension : `start` et `end` pourront avoir leur propre table.
  static StyleResolver<VertexLook> of(VertexVisualKind kind) => switch (kind) {
    VertexVisualKind.normal ||
    VertexVisualKind.start ||
    VertexVisualKind.end => _default,
  };

  static const _default = StyleResolver<VertexLook>(_lookOf);

  static VertexLook _lookOf(MapObjectVisualState s) => switch (s) {
    MapObjectVisualState.normal => const VertexLook(
      color: Color(0xFF219903),
      scale: 1.0,
      haloOpacity: 0.0,
    ),
    MapObjectVisualState.selected => const VertexLook(
      color: Color(0xFF2196F3),
      scale: 1.7,
      haloOpacity: 1.0,
    ),
    MapObjectVisualState.hovered => const VertexLook(
      color: Color(0xFFFFC107),
      scale: 1.15,
      haloOpacity: 0.4,
    ),
    MapObjectVisualState.dragging => const VertexLook(
      color: Color(0xFFFF5722),
      scale: 1.4,
      haloOpacity: 1.0,
    ),
  };

  static DrawCommand build(
    WorldOffset at,
    VertexLook look, {
    required ScreenLength radius,
  }) => DrawTransform(
    transform: DrawTransformData(scale: look.scale, origin: at),
    commands: [
      DrawCircle(center: at, radius: radius, style: Fill(look.color)),
      DrawCircle(
        center: at,
        radius: radius + haloGap.px,
        style: Stroke(
          look.color.withValues(alpha: look.haloOpacity),
          width: 1.px,
        ),
      ),
    ],
  );
}
