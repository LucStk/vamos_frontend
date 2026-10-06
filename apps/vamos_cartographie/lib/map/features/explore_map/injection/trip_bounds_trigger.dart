import 'package:flutter/painting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../camera/application/map_geo_mappers.dart';
import '../../../camera/domain/domain.dart';
import '../../../camera/injection/camera_director_provider.dart';
import 'explore_scene.dart';

part "trip_bounds_trigger.g.dart";

@Riverpod(dependencies: [cameraDirector])
void tripBoundsTrigger(Ref ref) {
  final director = ref.watch(cameraDirectorProvider);

  ref.listen(mapExploreProvider, (previous, next) {
    if (next.selection == null ||
        next.selection!.isSameAs(previous?.selection)) {
      return;
    }
    final bounds = ref.read(mapTripObjectProvider(next.selection!.id)).bounds;
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
