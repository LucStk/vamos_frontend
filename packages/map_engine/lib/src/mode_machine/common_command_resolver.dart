import '../domain/camera/map_camera.dart';
import '../domain/space/offset_type.dart';
import 'common_command.dart';
import 'transition.dart';

mixin CommonCommandResolver {
  MapCameraController get camera;

  Future<R?> resolveBase<R extends Object>(CommonCommand<R> command) async {
    final Object? result = switch (command) {
      ZoomIn(:final position) => _zoomIn(position),
      _ => null,
    };
    return result as R?; // le switch ne peut pas prouver que le type est R
  }

  Future<Done> _zoomIn(ScreenOffset m) async {
    final latLng = camera.screenOffsetToLatLng(m);
    camera.zoomIn(latLng: latLng);
    return const Done();
  }
}
