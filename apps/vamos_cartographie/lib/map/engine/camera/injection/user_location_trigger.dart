import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/app_services/app_services.dart';
import 'package:vamos_cartographie/map/engine/camera/camera.dart';
part 'user_location_trigger.g.dart';

@riverpod
void userLocationTrigger(Ref ref) {
  final director = ref.watch(cameraDirectorProvider);

  ref.listen(userLocationProvider, (previous, next) {
    if (next is! UserPositionActive || previous is UserPositionActive) return;

    director.submit(
      CameraRequest(
        FocusPoint(next.position, zoom: 16, minZoom: 14),
        priority: CameraPriority.ambient,
      ),
    );
  });
}
