import '../../domain/camera/map_camera.dart';
import '../../mode_machine/base_command.dart';
import '../../mode_machine/base_command_resolver.dart';
import '../../mode_machine/mode_command.dart';
import "view_trip_mode.dart";

final class ViewTripCommandResolver extends ModeCommandResolver<ViewTripMode>
    with BaseCommandResolver {
  @override
  final MapCameraController camera;
  const ViewTripCommandResolver(this.camera);

  @override
  Future<R?> resolve<R extends Object>(
    ModeCommand<ViewTripMode, R> command,
  ) async {
    if (command is BaseCommand<R>) return resolveBase(command);
    return null;
  }
}
