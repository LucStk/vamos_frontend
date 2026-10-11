import "../../camera/camera_director.dart";
import "../../domain/camera/map_camera.dart";
import "../../mode_machine/command/common_command.dart";
import "../../mode_machine/command/common_command_resolver.dart";
import "../../mode_machine/command/mode_command.dart";
import "map_explore_mode.dart";

final class ExploreCommandResolver extends ModeCommandResolver<MapExploreMode>
    with CommonCommandResolver {
  @override
  final CameraDirector director;
  ExploreCommandResolver(MapCameraController camera)
    : director = CameraDirector(camera: camera);

  @override
  Future<R?> resolve<R extends Object>(
    ModeCommand<MapExploreMode, R> command,
  ) async {
    if (command is CommonCommand<R>) return resolveCommon(command);
    return null;
  }
}
