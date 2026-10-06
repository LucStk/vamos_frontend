import 'package:domain_core/domain/collection_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/map.dart';

class MapEditorModeNotifier extends MapModeNotifier {
  final _queue = MapEffectQueue();
  bool _disposed = false;

  /// Accès typé : le state est un BaseMode côté contrat,
  /// mais ici on sait que c'est toujours un MapEditorMode.
  MapEditorMode get _mode => state as MapEditorMode;

  @override
  BaseMode build() {
    ref.onDispose(() => _disposed = true);
    return IdleEditor();
  }

  @override
  void handleGesture(MapGesture gesture, ScreenOffset offset) {
    final result = _mode.dispatchGesture(gesture, offset);
    if (result != null) apply(result);
  }

  void apply(GestureResult<MapEditorMode> result) {
    final next = result.mode;
    if (next != null) state = next;
    if (result.command != null) {
      _run(result.command!);
    }
    // result.command.forEach(_run);
  }

  void _run(MapCommand command) {
    _queue.add(() async {
      final result = await ref.read(mapCommandResolverProvide).resolve(command);
      if (_disposed) return;
      // Lu après l'await : c'est le mode réel du moment.
      final next = _mode.onCommandResult(result); // remplace modeAfter
      if (next != null) state = next;
    });
  }

  // startSketch, startSegmentEdit, etc. : remplace `state` par `_mode`
  // pour les lectures, les écritures `state = ...` restent inchangées.

  // --- Intentions de l'UI (boutons) : transitions pures, synchrones ---

  void startSketch() {
    switch (state.selection) {
      case MapVertex(:final id, :final position):
        state = SketchCreation(
          vertexStart: id,
          path: [position],
          mobilityType: MobilityType.bike,
        );
      case _:
    }
  }

  void startSegmentEdit() {
    switch (state.selection) {
      case MapSegment(:final id):
        state = SketchEdition(segmentId: id, path: []);
      case _:
    }
  }

  void stopSketch() => state = const IdleEditor();

  void deleteSelected() => apply(deleteSelection(state));

  void changeSegmentType(MobilityType t) =>
      apply(changeSelectedSegmentType(state, t));
}
