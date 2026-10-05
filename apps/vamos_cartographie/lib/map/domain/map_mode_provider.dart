// map_mode_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

/// Contrat commun à tous les notifiers de mode (éditeur, lecture seule...).
abstract class MapModeNotifier extends Notifier<BaseMode> {
  void handleGesture(MapGesture gesture, ScreenOffset offset);
}

/// Scopé : chaque MapScope le surcharge avec son notifier concret.
final mapModeProvider = NotifierProvider<MapModeNotifier, BaseMode>(
  () => throw StateError('mapMode doit être fourni par un MapScope'),
  dependencies: const [],
);
