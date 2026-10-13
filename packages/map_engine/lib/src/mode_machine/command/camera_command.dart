import '/src/camera/camera_director.dart';
import '/src/domain/camera/camera_request.dart';
import '/src/domain/space/offset_type.dart';
import '/src/mode_machine/command/command.dart';
import '/src/mode_machine/effect/results.dart';

abstract class CameraCommand extends Command<Done, CameraDirector> {
  const CameraCommand();
}

final class ZoomIn extends CameraCommand {
  const ZoomIn(this.position);
  final ScreenOffset position;
  @override
  Future<Done> handle(CameraDirector director) async {
    director.submit(
      CameraRequest(ZoomAt(position), priority: CameraPriority.explicit),
    );
    return const Done();
  }
}

final class CameraBack extends CameraCommand {
  const CameraBack();
  @override
  Future<Done> handle(CameraDirector director) async {
    director.back();
    return const Done();
  }
}

final class RequestCamera extends CameraCommand {
  const RequestCamera(this.request);
  final CameraRequest request;
  @override
  Future<Done> handle(CameraDirector director) async {
    director.submit(request);
    return const Done();
  }
}
