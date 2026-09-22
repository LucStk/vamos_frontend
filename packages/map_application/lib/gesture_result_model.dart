import 'base_mode_model.dart';

class MapCommand {
  const MapCommand();
}

class ExitMode extends MapCommand {
  const ExitMode();
}

final class GestureResult<T extends BaseMode<T>> {
  const GestureResult({this.mode, this.command});

  /// null = le mode ne change pas
  final T? mode;

  /// null = rien à exécuter
  final MapCommand? command;

  // Constructeurs nommés const au lieu de factories
  const GestureResult.none() : mode = null, command = null;

  const GestureResult.exitMode() : mode = null, command = const ExitMode();
}
