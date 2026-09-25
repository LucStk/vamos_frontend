import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/engine/engine.dart';
import 'package:vamos_cartographie/map/screens/explore_map/injection/injection.dart';

part "trip_bounds_trigger.g.dart";

@Riverpod(dependencies: [cameraDirector])
void tripBoundsTrigger(Ref ref) {
  final director = ref.watch(cameraDirectorProvider);

  ref.listen(exploreModeProvider, (previous, next) {
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
