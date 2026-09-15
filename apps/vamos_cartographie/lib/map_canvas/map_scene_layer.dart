import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/map/injection/map_editor_state.dart';
import 'package:vamos_cartographie/map/injection/map_scene_provider.dart';
import "map_scene_painter.dart";

class MapSceneLayer extends ConsumerWidget {
  final TripId tripId;
  const MapSceneLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectedScene = ref.watch(projectedSceneProvider(tripId));
    final selection = ref.watch(
      mapEditorStateProvider(tripId).select((m) => m.selection),
    );
    return CustomPaint(
      painter: MapScenePainter(scene: projectedScene, selection: selection),
      size: Size.infinite,
    );
  }
}
