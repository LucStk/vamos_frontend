// lib/commands/map_command.dart
import 'package:map_application/map_application.dart';

abstract interface class MapCommand {
  Future<MapState> execute(MapState state, MapEffectContext context);
}
