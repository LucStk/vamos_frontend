import 'package:latlong2/latlong.dart';
import 'package:map_engine/controller/controller.dart';

import 'base_mode_model.dart';

class MapCommand {
  const MapCommand();
}

class ExitMode extends MapCommand {
  const ExitMode();
}

final class GestureResult<T extends BaseMode> {
  const GestureResult({this.mode, this.command});

  /// null = le mode ne change pas
  final T? mode;

  /// null = rien à exécuter
  final MapCommand? command;

  factory GestureResult.none() {
    return GestureResult();
  }
  factory GestureResult.exitMode() {
    return GestureResult(command: ExitMode());
  }
}
