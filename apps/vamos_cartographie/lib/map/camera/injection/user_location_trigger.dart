import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/camera_request.dart';
import '/app_services/app_services.dart';
import 'camera_director_provider.dart';

part 'user_location_trigger.g.dart';

@Riverpod(dependencies: [cameraDirector])
void userLocationTrigger(Ref ref) {
  final director = ref.watch(cameraDirectorProvider);

  ref.listen(userLocationProvider, (previous, next) {
    print("userLocation reload");
    if (next is! UserPositionActive || previous is UserPositionActive) return;
    print("camera submit");
    director.submit(
      CameraRequest(
        FocusPoint(
          next.position,
        ), //remove zoom mais on peut le rajouter (a ajuster)
        priority: CameraPriority.ambient,
      ),
    );
  });
}
