import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/app_services/app_services.dart';

import '/map/engine/camera/camera.dart';

typedef CameraTrigger = void Function(WidgetRef ref);

void userLocationTrigger(WidgetRef ref) {
  ref.listenManual(userLocationProvider, (previous, next) {
    if (next is! UserPositionActive || previous is UserPositionActive) return;

    ref
        .read(cameraRequestsProvider.notifier)
        .submit(
          CameraRequest(
            FocusPoint(next.position, zoom: 16, minZoom: 14),
            priority: CameraPriority.ambient,
          ),
        );
  });
}

// void tripBoundsTrigger(WidgetRef ref) {
//   ref.listenManual(/* ton provider de trajet chargé */, (previous, next) {
//     // if (trajet vient d'arriver) {
//     //   submit(CameraRequest(FitBounds(bounds), priority: CameraPriority.content));
//     // }
//   });
// }
