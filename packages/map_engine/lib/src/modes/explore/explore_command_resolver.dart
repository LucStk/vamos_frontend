import "../../domain/camera/map_camera.dart";
import "../../mode_machine/base_command.dart";
import "../../mode_machine/base_command_resolver.dart";
import "../../mode_machine/mode_command.dart";
import "map_explore_mode.dart";

final class ExploreCommandResolver extends ModeCommandResolver<MapExploreMode>
    with BaseCommandResolver {
  @override
  final MapCameraController camera;
  const ExploreCommandResolver(this.camera);

  @override
  Future<R?> resolve<R extends Object>(
    ModeCommand<MapExploreMode, R> command,
  ) async {
    if (command is BaseCommand<R>) return resolveBase(command);
    return null;
  }
}
