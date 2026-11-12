import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/span_queries.dart';
import 'package:vamos_cartographie/map/objects/route/segment/providers/mobility_badge_item_provider.dart';
import 'package:vamos_cartographie/map/objects/route/segment/providers/segment_item_provider.dart';

part 'segments_layer.g.dart';

/// Couche « segments » d'un trajet : uniquement les traits.
///
/// Les segments doivent rester consécutifs dans la scène : c'est ce qui
/// permet à `elevateActive` de remonter le segment actif au-dessus de ses
/// voisins.
@Riverpod(keepAlive: true)
List<SceneItem> allSegmentItem(Ref ref, TripId tripId, MapCameraReader camera) {
  final sections = ref.watch(mobilitySpansProvider(tripId));
  return [
    for (final section in sections)
      ?ref.watch(segmentItemProvider(tripId, section.id, camera)),
  ];
}

/// Couche « badges » : séparée des segments, et placée au-dessus d'eux dans
/// les scènes, sinon un segment recouvre le badge de la section suivante.
@Riverpod(keepAlive: true)
List<SceneItem> allMobilityBadgeItem(
  Ref ref,
  TripId tripId,
  MapCameraReader camera,
) {
  final sections = ref.watch(mobilitySpansProvider(tripId));
  return [
    for (final section in sections)
      ?ref.watch(mobilityBadgeItemProvider(tripId, section.id, camera)),
  ];
}
