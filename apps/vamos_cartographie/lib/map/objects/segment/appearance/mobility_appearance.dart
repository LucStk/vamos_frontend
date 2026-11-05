// objects/segment/appearance/mobility_appearance.dart

import 'package:flutter/material.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/objects/segment/appearance/segment_appearance.dart';

abstract final class MobilityAppearances {
  static const _symbols = Rect.fromLTWH(0, -960, 960, 960);

  static final _glyphs = <MobilityType, IconGlyph>{
    MobilityType.bike: IconGlyph('M200-80q-…Z', viewBox: _symbols),
    MobilityType.car: IconGlyph('M240-200q-…Z', viewBox: _symbols),
    MobilityType.boat: IconGlyph('M120-80q-…Z', viewBox: _symbols),
    MobilityType.walk: IconGlyph('M400-80v-…Z', viewBox: _symbols),
    MobilityType.train: IconGlyph('M240-120q-…Z', viewBox: _symbols),
  };
  static final _segs = <MobilityType, SegmentAppearance>{
    MobilityType.bike: SegmentAppearance(color: Colors.blue),
    MobilityType.car: SegmentAppearance(color: Colors.deepOrangeAccent),
    MobilityType.boat: SegmentAppearance(color: Colors.cyan),
    MobilityType.walk: SegmentAppearance(color: Colors.lightGreen),
    MobilityType.train: SegmentAppearance(color: Colors.redAccent),
  };
  static IconGlyph glyphOf(MobilityType m) => _glyphs[m]!;
  static SegmentAppearance of(MobilityType? m) =>
      _segs[m] ?? SegmentAppearance.fallback;
}
