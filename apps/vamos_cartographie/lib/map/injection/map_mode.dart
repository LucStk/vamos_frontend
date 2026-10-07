import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_mode.g.dart';

/// État courant du mode (lecture seule), fourni par le scope.
@Riverpod(keepAlive: true, dependencies: [])
BaseMode mapMode(Ref ref) {
  throw StateError('mapMode doit être fourni par un MapScope');
}

/// Contrôleur du mode actif (reçoit les gestes), fourni par le scope.
@Riverpod(keepAlive: true, dependencies: [])
GestureSink mapModeController(Ref ref) {
  throw StateError('mapModeController doit être fourni par un MapScope');
}
