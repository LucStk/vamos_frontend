part of 'draw_command.dart';

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
    this.hatchPhasePx = 0.0,
    this.spacingPx = 4.0,
  });

  final Path path;
  final double widthPx; // largeur totale, contour compris
  final Color fillColor;
  final Color edgeColor;
  final Color hatchColor;
  final double edgePx; // épaisseur du contour
  final double hatchWidthPx; // épaisseur d'une barre
  /// Décalage des hachures, en px écran. 0 = rendu d'origine.
  final double hatchPhasePx;
  final double spacingPx; // distance perpendiculaire entre deux barres

  @override
  bool get dependsOnZoom => true;
}
