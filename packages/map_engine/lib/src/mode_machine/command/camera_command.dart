import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/domain/camera/camera_request.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/effect/results.dart';
import 'package:map_engine/src/mode_machine/command/scopes.dart';

abstract class CameraCommand extends Command<Done, CommonScope> {
  const CameraCommand();
}

final class ZoomIn extends CameraCommand {
  const ZoomIn(this.position);
  final ScreenOffset position;
  @override
  Future<Done> handle(CommonScope scope) async {
    scope.director.submit(
      CameraRequest(ZoomAt(position), priority: CameraPriority.explicit),
    );
    return const Done();
  }
}

final class CameraBack extends CameraCommand {
  const CameraBack();
  @override
  Future<Done> handle(CommonScope scope) async {
    scope.director.back();
    return const Done();
  }
}

final class RequestCamera extends CameraCommand {
  const RequestCamera(this.request);
  final CameraRequest request;
  @override
  Future<Done> handle(CommonScope scope) async {
    scope.director.submit(request);
    return const Done();
  }
}
