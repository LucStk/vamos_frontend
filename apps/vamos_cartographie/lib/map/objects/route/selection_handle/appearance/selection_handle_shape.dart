// selection_handle_shape.dart
import 'dart:math';
import 'dart:ui';
import "dart:typed_data";
import 'package:map_engine/map_engine.dart';

abstract final class SelectionHandleShape {
  static const radius = 8.0; // rayon du corps, en px
  static const tipToCenter = 15.0; // pointe -> centre du corps, en px

  /// Demi-goutte en px, (0,0) = pointe, y vers le bas.
  /// `start` = moitié gauche, `end` = moitié droite.
  static Path _halfDrop(HandleSide side) {
    const r = radius;
    const d = tipToCenter;

    // Point de tangence : la pointe voit le cercle sous l'angle θ.
    final theta = acos(r / d);
    final tangent = Offset(r * sin(theta), d - r * cos(theta));

    final circle = Rect.fromCircle(center: const Offset(0, d), radius: r);
    final path = Path()..moveTo(0, 0);

    switch (side) {
      case HandleSide.end:
        // pointe -> tangente droite -> arc par la droite -> bas -> axe
        path
          ..lineTo(tangent.dx, tangent.dy)
          ..arcTo(circle, theta - pi / 2, pi - theta, false);
      case HandleSide.start:
        // pointe -> bas (axe) -> arc par la gauche -> tangente gauche
        path
          ..lineTo(0, d + r)
          ..arcTo(circle, pi / 2, pi - theta, false);
    }
    return path..close();
  }
  // ... radius, tipToCenter inchangés

  /// Demi-goutte en px, tournée de [angle] radians autour de la pointe (0,0).
  /// angle = 0 : le corps pend vers le bas de l'écran.
  static Path halfDrop(HandleSide side, {double angle = 0}) {
    final path = _halfDrop(side); // ton code actuel, renommé en privé
    if (angle == 0) return path;

    final c = cos(angle), s = sin(angle);
    // Rotation 2D, matrice 4x4 colonne-major (comme dans paintAnchoredPath).
    final m = Float64List.fromList([
      c, s, 0, 0, //
      -s, c, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 1,
    ]);
    return path.transform(m);
  }
}
