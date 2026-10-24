import 'dart:ui';
import 'package:domain_core/space/offset_type.dart';
import 'package:map_canvas/src/domain/length.dart';
import 'package:map_canvas/src/domain/paint_spec.dart';

sealed class DrawCommand {
  const DrawCommand();
}

final class DrawTransform extends DrawCommand {
  const DrawTransform({required this.transform, required this.commands});
  final DrawTransformData transform;
  final List<DrawCommand> commands;
}

final class DrawGroup extends DrawCommand {
  const DrawGroup(this.commands);
  final List<DrawCommand> commands;
}

final class DrawTransformData {
  const DrawTransformData({
    this.scale = 1.0,
    this.translation = LengthOffset.zero,
    this.rotation = 0.0,
    this.origin = const WorldOffset(Offset.zero),
  });

  final double scale; // sans dimension
  final LengthOffset translation;
  final double rotation; // sans dimension
  final WorldOffset origin;
}

// --- Feuilles ---

final class DrawCircle extends DrawCommand {
  const DrawCircle({
    required this.center,
    required this.radius,
    required this.style,
  });
  final WorldOffset center;
  final Length radius;
  final PaintSpec style;
  bool get dependsOnZoom => radius.dependsOnZoom || style.dependsOnZoom;
}

final class DrawPath extends DrawCommand {
  const DrawPath({required this.path, required this.style});
  final Path path;
  final PaintSpec style;
  bool get dependsOnZoom => style.dependsOnZoom;
}

final class DrawAnchoredPath extends DrawCommand {
  const DrawAnchoredPath({
    required this.anchor,
    required this.path,
    required this.style,
  });

  final WorldOffset anchor;
  final Path path; // coordonnées en px, (0,0) = anchor, y vers le bas
  final PaintSpec style;

  bool get dependsOnZoom => true;
}

/// Trait plein avec hachures à 45° (style mur plein de plan d'architecte).
/// Toutes les dimensions sont en px écran : la commande est donc toujours
/// dans la passe dépendante du zoom.
final class DrawHatchedStroke extends DrawCommand {
  const DrawHatchedStroke({
    required this.path,
    required this.widthPx,
    required this.fillColor,
    required this.edgeColor,
    required this.hatchColor,
    this.edgePx = 1.0,
    this.hatchWidthPx = 1.2,
    this.spacingPx = 4.0,
  });

  final Path path;
  final double widthPx; // largeur totale, contour compris
  final Color fillColor;
  final Color edgeColor;
  final Color hatchColor;
  final double edgePx; // épaisseur du contour
  final double hatchWidthPx; // épaisseur d'une barre
  final double spacingPx; // distance perpendiculaire entre deux barres

  bool get dependsOnZoom => true;
}
