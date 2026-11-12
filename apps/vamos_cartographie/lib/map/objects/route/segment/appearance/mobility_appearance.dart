// lib/map/objects/route/segment/appearance/mobility_appearance.dart

import 'package:flutter/material.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/map/objects/route/segment/appearance/segment_appearance.dart';

/// Adaptateur « canvas » : ne définit AUCUN style, il traduit
/// [MobilityTypeStyle] (source de vérité) en types `map_canvas`.
abstract final class MobilityAppearances {
  /// Grille des tracés `MobilityTypeStyle.svgPath` (Material Icons : 24 x 24).
  static const _grid = Rect.fromLTWH(0, 0, 24, 24);

  static final _glyphs = <MobilityType, IconGlyph>{
    for (final style in MobilityTypeStyle.values)
      style.type: IconGlyph(style.svgPath, viewBox: _grid),
  };

  static final _segs = <MobilityType, SegmentAppearance>{
    for (final style in MobilityTypeStyle.values)
      style.type: SegmentAppearance(
        color: style.color,
        // TODO: si SegmentAppearance supporte le pointillé :
        // dashed: style.isDashed,
      ),
  };

  static IconGlyph glyphOf(MobilityType m) => _glyphs[m]!;
  static SegmentAppearance of(MobilityType? m) =>
      _segs[m] ?? SegmentAppearance.fallback;
}
