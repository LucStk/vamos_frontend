import 'package:flutter/painting.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../camera/application/map_geo_mappers.dart';
import '../../../camera/domain/domain.dart';
import '../../../camera/injection/camera_director_provider.dart';
import 'explore_mode.dart';
import 'explore_scene.dart';

part "trip_bounds_trigger.g.dart";

@Riverpod(dependencies: [cameraDirector])
void tripBoundsTrigger(Ref ref) {
  final director = ref.watch(cameraDirectorProvider);

  ref.listen(mapExploreProvider, (previous, next) {
    if (next is! TripSelectMode) {
      return;
    }
    if ((previous, next) case (
      TripSelectMode m,
      TripSelectMode t,
    ) when m.trip.isSameAs(t.trip)) {
      return;
    }
    final bounds = ref.read(mapTripObjectProvider(next.trip.id)).bounds;
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
