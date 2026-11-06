import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/section_queries.dart';
import 'package:vamos_cartographie/map/objects/route/segment/providers/mobility_badge_item_provider.dart';
import 'package:vamos_cartographie/map/objects/route/segment/providers/segment_item_provider.dart';

part 'segments_layer.g.dart';

/// Couche « segments » d'un trajet : agrège les items de toutes ses sections.
@Riverpod(keepAlive: true)
List<SceneItem> allSegmentItem(Ref ref, TripId tripId, MapCameraReader camera) {
  final sections = ref.watch(allSectionsProvider(tripId));
  return [
    for (final section in sections) ...[
      ?ref.watch(mobilityBadgeItemProvider(tripId, section.id, camera)),
      ?ref.watch(segmentItemProvider(tripId, section.id, camera)),
    ],
  ];
}
