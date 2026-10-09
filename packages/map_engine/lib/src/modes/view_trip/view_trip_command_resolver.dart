import '../../domain/camera/map_camera.dart';
import '../../mode_machine/common_command.dart';
import '../../mode_machine/common_command_resolver.dart';
import '../../mode_machine/mode_command.dart';
import "view_trip_mode.dart";

final class ViewTripCommandResolver extends ModeCommandResolver<ViewTripMode>
    with CommonCommandResolver {
  @override
  final MapCameraController camera;
  const ViewTripCommandResolver(this.camera);

  @override
  Future<R?> resolve<R extends Object>(
    ModeCommand<ViewTripMode, R> command,
  ) async {
    if (command is CommonCommand<R>) return resolveBase(command);
    return null;
  }
}
