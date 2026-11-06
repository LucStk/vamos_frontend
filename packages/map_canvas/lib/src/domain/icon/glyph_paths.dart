// map_canvas/lib/src/domain/icon/glyph_paths.dart
import 'dart:ui';
import 'package:map_canvas/src/domain/icon/icon_glyph.dart';
import 'package:path_parsing/path_parsing.dart';
import 'package:vector_math/vector_math_64.dart';

final class _UiPathProxy extends PathProxy {
  _UiPathProxy(this.path);
  final Path path;

  @override
  void moveTo(double x, double y) => path.moveTo(x, y);
  @override
  void lineTo(double x, double y) => path.lineTo(x, y);
  @override
  void cubicTo(
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
  ) => path.cubicTo(x1, y1, x2, y2, x3, y3);
  @override
  void close() => path.close();
}

Path parseGlyph(IconGlyph g) {
  final path = Path()..fillType = g.fillType;
  writeSvgPathDataToPath(g.d, _UiPathProxy(path));
  return path;
}

// map_canvas/lib/src/domain/icon/glyph_paths.dart
abstract final class GlyphPaths {
  static final _raw = <String, Path>{};
  static final _scaled = <(String, Offset?, double), Path>{};

  /// Chemin en px, centré sur (0,0), inscrit dans un carré de [sizePx].
  static Path anchored(IconGlyph g, {required double sizePx}) =>
      _scaled.putIfAbsent((g.d, g.anchor, sizePx), () {
        final raw = _raw.putIfAbsent(g.d, () => parseGlyph(g));
        final a = g.anchor ?? g.viewBox.center;
        final s = sizePx / g.viewBox.width;
        final m = Matrix4.identity()
          ..translateByVector2(Vector2(-s * a.dx, -s * a.dy))
          ..scaleByVector3(Vector3(s, s, 0));
        return raw.transform(m.storage);
      });
}
