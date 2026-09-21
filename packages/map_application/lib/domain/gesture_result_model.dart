import 'base_mode_model.dart';

class MapCommand {
  const MapCommand();
}

final class GestureResult<T extends BaseMode> {
  const GestureResult({this.mode, this.command});

  /// null = le mode ne change pas
  final T? mode;

  /// null = rien à exécuter
  final MapCommand? command;

  static const none = GestureResult();
}
