import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/camera.dart';
import 'injection.dart';

part "trip_bounds_trigger.g.dart";

@Riverpod(dependencies: [cameraDirector, MapExplore])
void tripBoundsTrigger(Ref ref) {
  final director = ref.watch(cameraDirectorProvider);

  ref.listen(mapExploreProvider, (previous, next) {
    if (next.tripSelect == null || previous?.tripSelect == next.tripSelect) {
      return;
    }
    final bounds = ref.read(mapTripObjectProvider(next.tripSelect!)).bounds;
    if (bounds == null) {
      return;
    }
    director.submit(
      CameraRequest(
        FitBounds(bounds.toFlutterMap()),
        priority: CameraPriority.content,
      ),
    );
  });
}
