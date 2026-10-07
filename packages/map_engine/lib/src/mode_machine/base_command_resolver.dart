import '../domain/camera/map_camera.dart';
import '../domain/space/offset_type.dart';
import 'base_command.dart';
import 'gesture_result.dart';

mixin BaseCommandResolver {
  MapCameraController get camera;

  Future<R?> resolveBase<R extends Object>(BaseCommand<R> command) async {
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
