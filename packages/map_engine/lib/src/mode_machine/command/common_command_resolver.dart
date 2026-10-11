import '../../camera/camera_director.dart';
import '../../domain/camera/camera_request.dart';
import '../../domain/space/offset_type.dart';
import '../transition.dart';
import 'common_command.dart';

mixin CommonCommandResolver {
  CameraDirector get director;

  Future<R?> resolveCommon<R extends Object>(CommonCommand<R> command) async {
    final Object? result = switch (command) {
      RequestCamera(:final request) => _submit(request),
      CameraBack() => _back(),
      ZoomIn(:final position) => _zoomIn(position),
      _ => null,
    };
    return result as R?;
  }

  Future<Done> _zoomIn(ScreenOffset p) async {
    director.submit(
      CameraRequest(ZoomAt(p), priority: CameraPriority.explicit),
    );
    return const Done();
  }
  // _submit et _back inchangés

  Future<Done> _submit(CameraRequest r) async {
    director.submit(r);
    return const Done();
  }

  Future<Done> _back() async {
    director.back();
    return const Done();
  }
}
