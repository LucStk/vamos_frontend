import '../../camera/camera_director.dart';
import '../../domain/camera/map_camera.dart';

import '../../mode_machine/command/common_command.dart';
import '../../mode_machine/command/common_command_resolver.dart';
import '../../mode_machine/command/mode_command.dart';
import "view_trip_mode.dart";

final class ViewTripCommandResolver extends ModeCommandResolver<ViewTripMode>
    with CommonCommandResolver {
  @override
  final CameraDirector director;
  ViewTripCommandResolver(MapCameraController camera)
    : director = CameraDirector(camera: camera);

  @override
  Future<R?> resolve<R extends Object>(
    ModeCommand<ViewTripMode, R> command,
  ) async {
    if (command is CommonCommand<R>) return resolveCommon(command);
    return null;
  }
}
