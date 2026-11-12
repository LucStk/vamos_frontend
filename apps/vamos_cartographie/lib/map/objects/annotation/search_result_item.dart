import 'dart:ui';

import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';

import 'package:map_engine/map_engine.dart';

final class SearchResultItem extends PointItem {
  SearchResultItem({required this.object, required this.worldPosition});

  @override
  final MapSearchResult object;

  @override
  final WorldOffset worldPosition;

  @override
  final ScreenLength visualRadius = 9.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) {
    return DrawCircle(
      center: worldPosition,
      radius: visualRadius,
      style: Fill(Color(0xFF219903)),
    );
  }
}
