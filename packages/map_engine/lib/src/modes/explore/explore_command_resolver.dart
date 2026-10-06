import '../../../map_engine.dart';

final class ExploreCommandResolver extends ModeCommandResolver<MapExploreMode> {
  const ExploreCommandResolver();

  @override
  Future<R?> resolve<R extends Object>(
    ModeCommand<MapExploreMode, R> command,
  ) async {
    return null;
  }
}
