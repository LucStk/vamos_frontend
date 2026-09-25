import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/map.dart';

part 'camera_director_provider.g.dart';

@Riverpod(dependencies: [mapContext])
CameraDirector cameraDirector(Ref ref) {
  final director = CameraDirector(
    camera: () => ref.read(mapContextProvider.select((c) => c.camera)),
  );

  // Un geste utilisateur bloque les demandes `ambient`.
  final gestures = ref
      .watch(mapContextProvider.select((c) => c.camera.mapController))
      .mapEventStream
      .where((e) => _isUserGesture(e.source))
      .listen((_) => director.onUserGesture());

  ref.onDispose(() {
    gestures.cancel();
    director.dispose();
  });

  return director;
}

bool _isUserGesture(MapEventSource source) => switch (source) {
  MapEventSource.dragStart ||
  MapEventSource.onDrag ||
  MapEventSource.multiFingerGestureStart ||
  MapEventSource.onMultiFinger ||
  MapEventSource.scrollWheel ||
  MapEventSource.doubleTap ||
  MapEventSource.flingAnimationController => true,
  _ => false,
};
