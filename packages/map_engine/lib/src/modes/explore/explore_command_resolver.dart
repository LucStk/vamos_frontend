import "../../domain/camera/map_camera.dart";
import "../../mode_machine/common_command.dart";
import "../../mode_machine/common_command_resolver.dart";
import "../../mode_machine/mode_command.dart";
import "map_explore_mode.dart";

final class ExploreCommandResolver extends ModeCommandResolver<MapExploreMode>
    with CommonCommandResolver {
  @override
  final MapCameraController camera;
  const ExploreCommandResolver(this.camera);

  @override
  Future<R?> resolve<R extends Object>(
    ModeCommand<MapExploreMode, R> command,
  ) async {
    if (command is CommonCommand<R>) return resolveBase(command);
    return null;
  }
}
