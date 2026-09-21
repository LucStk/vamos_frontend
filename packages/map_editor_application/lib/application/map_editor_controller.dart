import 'package:map_application/application/map_command_resolver.dart';
import 'package:map_application/domain/domain.dart';
import 'package:map_editor_application/application/intents.dart';
import 'package:map_editor_application/application/mode_after.dart';
import 'package:map_editor_application/domain/domain.dart';
import 'package:map_editor_application/domain/effect_queue.dart';
import 'package:map_engine/map_engine.dart';
import 'package:meta/meta.dart';
import 'package:trip_application/topology/topology.dart';
import 'package:trip_application/waypoint/application/waypoint_editor.dart';

final class MapEditorController extends BaseController<MapEditorMode> {
  MapEditorController({
    required GraphEditor graphEditor,
    required WaypointEditor waypointEditor,
    required super.camera,
    required super.onModeChanged,
  }) : _commandResolver = MapCommandResolver(
         graphEditor: graphEditor,
         waypointEditor: waypointEditor,
       ),
       super(initialMode: const Idle());

  final MapCommandResolver _commandResolver;
  final MapEffectQueue _effectQueue = MapEffectQueue();

  // --- Exécution des commandes émises par les handlers ---

  @override
  @protected
  void onCommand(MapCommand command) {
    // Commande purement "mode" : pas d'I/O, donc pas de queue.
    if (command is ExitMode) {
      mode = const Idle();
      return;
    }

    _effectQueue.add(() async {
      final result = await _commandResolver.resolve(command);
      // `mode` est lu ICI, après l'await : c'est le mode réel du moment.
      final updated = modeAfter(mode, result);
      if (updated != null) mode = updated;
    });
  }

  // --- Intentions de l'UI (boutons) ---

  void startSketch() {
    switch (mode.selection) {
      case MapVertex(:final id, :final position):
        mode = SketchCreation(
          vertexStart: id,
          path: [position],
          mobilityType: MobilityType.bike,
        );
      case _:
    }
  }

  void startSegmentEdit() {
    switch (mode.selection) {
      case MapSegment(:final id):
        mode = SketchEdition(segmentId: id, path: []);
      case _:
    }
  }

  void stopSketch() {
    mode = const Idle();
  }

  void deleteSelected() => apply(deleteSelection(mode));

  void changeSegmentType(MobilityType t) =>
      apply(changeSelectedSegmentType(mode, t));
}
