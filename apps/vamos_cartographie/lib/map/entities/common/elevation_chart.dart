import 'dart:math';

import 'package:material_ui/material_ui.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/entities/common/stats/stat_item.dart';

/// Profil d'élévation le long d'un parcours : aire sous la courbe, altitudes
/// min et max, distance totale.
class ElevationChart extends StatelessWidget {
  const ElevationChart({
    super.key,
    required this.points,
    required this.color,
    this.height = 130,
  });

  final List<ElevationPoint> points;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: _ElevationPainter(
          points: points,
          color: color,
          textStyle: theme.textTheme.labelSmall ?? const TextStyle(),
          gridColor: theme.colorScheme.outlineVariant,
          textColor: theme.colorScheme.onSurfaceVariant,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _ElevationPainter extends CustomPainter {
  _ElevationPainter({
    required this.points,
    required this.color,
    required this.textStyle,
    required this.gridColor,
    required this.textColor,
  });

  final List<ElevationPoint> points;
  final Color color;
  final TextStyle textStyle;
  final Color gridColor;
  final Color textColor;

  static const _leftGutter = 44.0;
  static const _bottomGutter = 16.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    final plot = Rect.fromLTRB(
      _leftGutter,
      4,
      size.width - 4,
      size.height - _bottomGutter,
    );
    final totalM = points.last.distanceM;
    var lo = points.map((p) => p.elevationM).reduce(min);
    var hi = points.map((p) => p.elevationM).reduce(max);
    // Un profil plat reste un trait lisible, pas une division par zéro.
    if (hi - lo < 10) {
      final mid = (hi + lo) / 2;
      lo = mid - 5;
      hi = mid + 5;
    }
    if (totalM <= 0) return;

    Offset at(ElevationPoint p) => Offset(
      plot.left + plot.width * (p.distanceM / totalM),
      plot.bottom - plot.height * ((p.elevationM - lo) / (hi - lo)),
    );

    // Repères horizontaux : altitudes min et max.
    final grid = Paint()
      ..color = gridColor
      ..strokeWidth = 1;
    for (final y in [plot.top, plot.bottom]) {
      canvas.drawLine(Offset(plot.left, y), Offset(plot.right, y), grid);
    }

    final line = Path()..moveTo(at(points.first).dx, at(points.first).dy);
    for (final p in points.skip(1)) {
      final o = at(p);
      line.lineTo(o.dx, o.dy);
    }
    final area = Path.from(line)
      ..lineTo(plot.right, plot.bottom)
      ..lineTo(plot.left, plot.bottom)
      ..close();
    canvas.drawPath(
      area,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color.withValues(alpha: 0.45),
            color.withValues(alpha: 0.05),
          ],
        ).createShader(plot),
    );
    canvas.drawPath(
      line,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeJoin = StrokeJoin.round,
    );

    _label(canvas, '${hi.round()} m', Offset(0, plot.top - 6), _leftGutter - 4);
    _label(
      canvas,
      '${lo.round()} m',
      Offset(0, plot.bottom - 10),
      _leftGutter - 4,
    );
    _label(
      canvas,
      '0',
      Offset(plot.left, plot.bottom + 2),
      40,
      align: TextAlign.left,
    );
    _label(
      canvas,
      formatDistance(totalM),
      Offset(plot.right - 60, plot.bottom + 2),
      60,
      align: TextAlign.right,
    );
  }

  void _label(
    Canvas canvas,
    String text,
    Offset at,
    double width, {
    TextAlign align = TextAlign.right,
  }) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle.copyWith(color: textColor),
      ),
      textAlign: align,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout(maxWidth: width, minWidth: width);
    painter.paint(canvas, at);
  }

  @override
  bool shouldRepaint(_ElevationPainter old) =>
      old.points != points || old.color != color;
}
