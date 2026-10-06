import '../../mode_machine/mode_command.dart';
import "view_trip_mode.dart";

final class ViewTripCommandResolver extends ModeCommandResolver<ViewTripMode> {
  const ViewTripCommandResolver();

  @override
  Future<R?> resolve<R extends Object>(
    ModeCommand<ViewTripMode, R> command,
  ) async {
    return null;
  }
}
