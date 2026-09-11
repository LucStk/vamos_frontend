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
  void paint(
    Canvas canvas, {
    MapPaintContext context = const MapPaintContext(),
  }) {
    // 1. Déterminer le facteur d'échelle selon la sélection
    final isSelected = context.state == MapObjectVisualState.selected;
    final scale = isSelected
        ? 1.5
        : 1.0; // Augmente la taille de 50% si sélectionné

    canvas.save();

    // 2. Translater vers la position puis appliquer le scale
    canvas.translate(projectedPosition.dx, projectedPosition.dy);
    canvas.scale(scale);

    // 3. Dessiner le point unique au centre (0,0)
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = isSelected
          ? const Color(0xFF2196F3)
          : const Color(0xFF219903); // Optionnel : changer la couleur

    canvas.drawCircle(Offset.zero, 8, paint);

    // 4. Si sélectionné, ajouter une bordure de sélection (Optionnel)
    if (isSelected) {
      final selectionPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = const Color(0xFFAA1238);

      canvas.drawCircle(Offset.zero, 8, selectionPaint);
    }

    canvas.restore();
  }
}
