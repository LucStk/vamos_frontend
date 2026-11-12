// selection_handle_shape.dart
import 'dart:math';
import 'dart:ui';
import "dart:typed_data";

abstract final class SelectionHandleShape {
  static const radius = 9.0; // rayon du corps, en px
  static const tipToCenter = 15.0; // pointe -> centre du corps, en px

  /// Goutte entière en px : pointe en (0,0), corps pendu vers le bas (y > 0).
  static final Path _drop = () {
    const r = radius;
    const d = tipToCenter;

    final theta = acos(r / d); // la pointe voit le cercle sous cet angle
    final tangent = Offset(r * sin(theta), d - r * cos(theta));
    final circle = Rect.fromCircle(center: const Offset(0, d), radius: r);

    return Path()
      ..moveTo(0, 0)
      ..lineTo(tangent.dx, tangent.dy) // tangente droite
      ..arcTo(circle, theta - pi / 2, 2 * pi - 2 * theta, false) // par le bas
      ..close(); // tangente gauche, retour à la pointe
  }();

  /// Goutte tournée autour de la pointe.
  /// [angle] : orientation de la route (0 = route vers la droite, le corps pend
  /// sous elle). `start` s'incline vers l'arrière, `end` vers l'avant.
  static Path drop({double angle = 0}) {
    final c = cos(angle), s = sin(angle);
    // Rotation 2D, matrice 4x4 colonne-major (comme dans paintAnchoredPath).
    final m = Float64List.fromList([
      c, s, 0, 0, //
      -s, c, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 1,
    ]);
    return _drop.transform(m);
  }

  /// Centre du corps, dans le même repère que [drop].
  static Offset bodyCenter(double angle) =>
      Offset(-tipToCenter * sin(angle), tipToCenter * cos(angle));
}
