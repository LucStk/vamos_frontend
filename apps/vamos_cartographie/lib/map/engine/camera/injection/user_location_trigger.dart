import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/app_services/app_services.dart';
import 'package:vamos_cartographie/map/engine/camera/camera.dart';
part 'user_location_trigger.g.dart';

@Riverpod(dependencies: [mapController])
void userLocationTrigger(Ref ref) {
  final director = ref.watch(cameraDirectorProvider);

  ref.listen(userLocationProvider, (previous, next) {
    print("userLocation reload");
    if (next is! UserPositionActive || previous is UserPositionActive) return;
    print("camera submit");
    director.submit(
      CameraRequest(
        FocusPoint(next.position, zoom: 16, minZoom: 14),
        priority: CameraPriority.ambient,
      ),
    );
  });
}
