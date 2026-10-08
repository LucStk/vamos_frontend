import 'package:flutter/painting.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/map/camera/application/map_geo_mappers.dart';
import '/map/camera/domain/domain.dart';
import '/map/camera/injection/camera_director_provider.dart';
import 'explore_mode.dart';
import 'explore_scene.dart';

part "trip_bounds_trigger.g.dart";

@Riverpod(dependencies: [cameraDirector, MapExplore])
void tripBoundsTrigger(Ref ref) {
  final director = ref.watch(cameraDirectorProvider);

  ref.listen(mapExploreProvider, (previous, next) {
    if (next.context.get(selectionSlot) is! TripSelection) {
      return;
    }
    if ((previous?.context.get(selectionSlot), next.context.get(selectionSlot))
        case (TripSelection m, TripSelection t) when m != t) {
      return;
    }
    final bounds = ref
        .read(
          mapTripObjectProvider(
            (next.context.get(selectionSlot) as TripSelection).id,
          ),
        )
        .bounds;
    if (bounds == null) {
      return;
    }
    director.submit(
      CameraRequest(
        FitBounds(
          bounds.toFlutterMap(),
          padding: const EdgeInsets.only(bottom: 20),
        ),
        priority: CameraPriority.content,
      ),
    );
  });
}
