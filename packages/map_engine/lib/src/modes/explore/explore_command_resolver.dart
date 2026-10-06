import "../../mode_machine/mode_command.dart";
import "map_explore_mode.dart";

final class ExploreCommandResolver extends ModeCommandResolver<MapExploreMode> {
  const ExploreCommandResolver();

  @override
  Future<R?> resolve<R extends Object>(
    ModeCommand<MapExploreMode, R> command,
  ) async {
    return null;
  }
}
