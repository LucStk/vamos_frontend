import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart'; // Pour ton type Id<Segment>

part 'map_interaction_notifier.g.dart';

@Riverpod(keepAlive: true)
class MapInteraction extends _$MapInteraction {
  @override
  LayerHitResult<Id<Segment>>? build() {
    return null; // L'état initial est null (pas de survol)
  }

  LayerHitResult<Id<Segment>>? getState() {
    return state;
  }

  // Permet au PolylineLayer de mettre à jour le hitResult lors du survol
  void updateHitResult(LayerHitResult<Id<Segment>>? hitResult) {
    state = hitResult;
  }

  // Déclenché uniquement lors d'un vrai clic sur la carte
  void handlePolylineTap(MapCamera camera) {
    final hitResult = state;
    if (hitResult == null) return;

    final clickedLines = hitResult.hitValues;

    if (clickedLines.isNotEmpty) {
      final Id<Segment> segmentId = clickedLines.first;
      final Offset tapOffset = hitResult.point;

      // Conversion des pixels en LatLng via la camera passée en paramètre
      final LatLng tapPosition = camera.screenOffsetToLatLng(tapOffset);

      debugPrint("Clic Riverpod sur le segment : $segmentId");
      debugPrint("Position géographique exacte : $tapPosition");

      // Tu peux appeler d'autres orchestrateurs ici si besoin :
      // ref.read(displaySegmentOrchestratorProvider(...).notifier).select(segmentId);
    }
  }
}
