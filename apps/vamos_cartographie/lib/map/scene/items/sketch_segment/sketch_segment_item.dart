import 'dart:ui';

import 'package:domain_core/space/world_segment.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

import 'dart:math' as math;

abstract final class SketchSegmentStyle {
  static const _fill = Color(0xFFF2F2F2); // papier
  static const _fillBusy = Color(0xFFDDE8F5); // bleu pâle : en cours
  static const _edge = Color(0xFF4A4A4A); // contour
  static const _hatch = Color(0xFF8C8C8C); // barres grises

  static const _pulsePeriod = 1.4; // secondes
  static const _hatchSpeed = 28.0; // px / s

  /// L'épaisseur vient de l'item : `radius * 2`.
  ///
  /// [time] : horloge continue (0 = arrêtée). Si [pending] et que l'horloge
  /// est arrêtée (animations réduites), le fond « occupé » reste fixe.
  static DrawCommand build(
    Path path, {
    required ScreenLength radius,
    bool pending = false,
    double time = 0,
  }) {
    final pulse = !pending
        ? 0.0
        : time == 0
        ? 1.0
        : 0.5 - 0.5 * math.cos(2 * math.pi * time / _pulsePeriod);

    return DrawHatchedStroke(
      path: path,
      widthPx: radius.value,
      fillColor: Color.lerp(_fill, _fillBusy, pulse)!,
      edgeColor: _edge,
      hatchColor: _hatch,
      hatchPhasePx: pending ? time * _hatchSpeed : 0,
    );
  }
}

final class SketchSegmentItem extends LineItem {
  SketchSegmentItem({
    required this.object,
    required this.worldSegments,
    this.pending = false,
  });

  @override
  final MapSketchSegment object;

  @override
  final List<WorldSegment> worldSegments;

  /// `true` pendant la génération de la route par le serveur.
  final bool pending;

  /// Demi-largeur du trait (10 px au total) : il faut un peu de place
  /// pour que les hachures se lisent.
  @override
  ScreenLength get visualRadius => 5.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => SketchSegmentStyle.build(
    path,
    radius: visualRadius,
    pending: pending,
    time: context.time,
  );
}
