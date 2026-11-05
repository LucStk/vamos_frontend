import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:domain_core/space/offset_type.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

final class PencilItem extends PointItem {
  PencilItem({required this.worldPosition});

  @override
  final MapSketchPencil object = MapSketchPencil();

  @override
  final WorldOffset worldPosition;

  @override
  final ScreenLength visualRadius = 9.px;

  /// Plus utilisé par [isHitAt], mais gardé car requis par l'API des items.
  @override
  ScreenLength get hitRadius => 14.px;

  /// Inclinaison vers la droite (radians, sens horaire). ~34°.
  static const double _tilt = 0.6;

  // Dimensions du crayon en px, dans son repère vertical (pointe en 0,0).
  static const double _length = 32.0;
  static const double _halfWidth = 4.6;

  /// Marge de confort autour du crayon (px), utile au doigt.
  static const double _hitPadding = 6.0;

  static final double _cosTilt = cos(_tilt);
  static final double _sinTilt = sin(_tilt);

  /// Calques du crayon, du dessous vers le dessus.
  /// Le crayon est construit à la verticale, pointe en (0,0), corps vers y < 0,
  /// puis tourné une seule fois d'un angle [_tilt].
  static final List<(Path, Color)> _layers = _buildLayers();

  static List<(Path, Color)> _buildLayers() {
    final c = _cosTilt, s = _sinTilt;
    // Rotation 2D autour de (0,0) = pointe (matrice 4x4 colonne-major).
    final m = Float64List.fromList([
      c, s, 0, 0, //
      -s, c, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 1,
    ]);

    Path poly(List<Offset> pts) => Path()..addPolygon(pts, true);
    Path rect(double l, double t, double r, double b) =>
        Path()..addRect(Rect.fromLTRB(l, t, r, b));

    // Silhouette sombre légèrement plus grande : sert de contour.
    final outline = Path()
      ..addPolygon(const [
        Offset(0, 1),
        Offset(-4.6, -7),
        Offset(4.6, -7),
      ], true)
      ..addRRect(
        RRect.fromLTRBAndCorners(
          -4.6,
          -32,
          4.6,
          -7,
          topLeft: const Radius.circular(2.5),
          topRight: const Radius.circular(2.5),
        ),
      );

    final eraser = Path()
      ..addRRect(
        RRect.fromLTRBAndCorners(
          -3.5,
          -31,
          3.5,
          -27,
          topLeft: const Radius.circular(2),
          topRight: const Radius.circular(2),
        ),
      );

    final layers = <(Path, Color)>[
      (outline, const Color(0xFF3A3A3A)),
      (
        poly(const [Offset(0, 0), Offset(-3.5, -7), Offset(3.5, -7)]),
        const Color(0xFFF1D3A5),
      ), // bois taillé
      (
        poly(const [Offset(0, 0), Offset(-1.3, -2.6), Offset(1.3, -2.6)]),
        const Color(0xFF333333),
      ), // mine
      (rect(-3.5, -24, 3.5, -7), const Color(0xFFF5C518)), // corps
      (rect(0.5, -24, 3.5, -7), const Color(0xFFD9A600)), // ombre du corps
      (rect(-3.5, -27, 3.5, -24), const Color(0xFFB0B7BF)), // virole
      (eraser, const Color(0xFFE57373)), // gomme
    ];

    return [for (final (p, col) in layers) (p.transform(m), col)];
  }

  @override
  bool isHitAt(WorldOffset p, double zoomScale) {
    // Écart à la pointe en px écran (le crayon a une taille constante en px).
    final d = (p.value - worldPosition.value) * zoomScale;

    // Rotation inverse de _tilt : on se ramène au crayon vertical.
    final lx = _cosTilt * d.dx + _sinTilt * d.dy;
    final ly = -_sinTilt * d.dx + _cosTilt * d.dy;

    // Le corps s'étend vers y < 0, de la pointe (0) à -_length.
    return lx.abs() <= _halfWidth + _hitPadding &&
        ly >= -_length - _hitPadding &&
        ly <= _hitPadding;
  }

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) {
    return DrawGroup([
      for (final (path, color) in _layers)
        DrawAnchoredPath(anchor: worldPosition, path: path, style: Fill(color)),
    ]);
  }
}
