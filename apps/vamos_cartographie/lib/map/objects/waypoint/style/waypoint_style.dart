import 'dart:ui';

import 'package:domain_core/space/offset_type.dart';
import 'package:map_canvas/map_canvas.dart';

enum WaypointVisualKind { normal, start, end }

final class WaypointLook implements Lerpable<WaypointLook> {
  const WaypointLook({
    required this.color,
    required this.scale,
    required this.haloOpacity,
  });
  final Color color;
  final double scale, haloOpacity;

  @override
  WaypointLook lerp(WaypointLook o, double t) => WaypointLook(
    color: Color.lerp(color, o.color, t)!,
    scale: lerpDouble(scale, o.scale, t)!,
    haloOpacity: lerpDouble(haloOpacity, o.haloOpacity, t)!,
  );
}

abstract final class WaypointStyle {
  /// Écart entre le disque plein et l'anneau de halo.
  static const haloGap = 1.0;

  /// Point d'extension : `start` et `end` pourront avoir leur propre table.
  static StyleResolver<WaypointLook> of(WaypointVisualKind kind) =>
      switch (kind) {
        WaypointVisualKind.normal ||
        WaypointVisualKind.start ||
        WaypointVisualKind.end => _default,
      };

  static const _default = StyleResolver<WaypointLook>(_lookOf);

  static WaypointLook _lookOf(MapObjectVisualState s) => switch (s) {
    MapObjectVisualState.normal => const WaypointLook(
      color: Color(0xFF219903),
      scale: 1.0,
      haloOpacity: 0.0,
    ),
    MapObjectVisualState.selected => const WaypointLook(
      color: Color(0xFF2196F3),
      scale: 1.7,
      haloOpacity: 1.0,
    ),
    MapObjectVisualState.hovered => const WaypointLook(
      color: Color(0xFFFFC107),
      scale: 1.15,
      haloOpacity: 0.4,
    ),
    MapObjectVisualState.dragging => const WaypointLook(
      color: Color(0xFFFF5722),
      scale: 1.4,
      haloOpacity: 1.0,
    ),
  };

  static DrawCommand build(
    WorldOffset at,
    WaypointLook look, {
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
