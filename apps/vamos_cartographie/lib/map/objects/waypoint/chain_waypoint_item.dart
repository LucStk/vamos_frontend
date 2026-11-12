import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/sketch_trace/sketch_segment_item.dart';

final class ChainWaypointItem extends LineItem {
  ChainWaypointItem({
    required this.object,
    required this.worldSegments,
    this.pending = false,
  });

  @override
  final MapChainWaypoint object;

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
