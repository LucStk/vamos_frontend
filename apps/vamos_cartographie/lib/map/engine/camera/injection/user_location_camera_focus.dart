import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/app_services/app_services.dart';
import 'map_camera_provider.dart';

part "user_location_camera_focus.g.dart";

@riverpod
void userLocationCameraFocus(Ref ref) {
  ref.listen(userLocationProvider, (previous, next) {
    // Seulement au passage vers Active : pas à chaque mise à jour du stream,
    // sinon la caméra se recentrerait tous les 5 m et lutterait contre le pan
    // de l'utilisateur.
    final justBecameActive =
        next is UserPositionActive && previous is! UserPositionActive;
    if (!justBecameActive) return;

    final camera = ref.read(mapCameraHolderProvider);
    camera.zoomTo(next.position, deltaZoom: 16); // à adapter à ton API
  });
}
