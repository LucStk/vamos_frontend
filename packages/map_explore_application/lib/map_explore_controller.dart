import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_application/application/map_command_resolver.dart';
import 'package:map_application/domain/domain.dart';
import 'package:map_editor_application/application/application.dart'
    as gesture_handler;
import 'package:map_editor_application/application/mode_after.dart';
import 'package:map_editor_application/domain/domain.dart';
import 'package:map_editor_application/domain/effect_queue.dart';
import 'package:map_engine/map_engine.dart';
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

  void _apply(GestureResult<MapEditorMode> result) {
    final next = result.mode;
    if (next != null) mode = next;

    final command = result.command;
    if (command != null) {
      _effectQueue.add(() async {
        final commandResult = await _commandResolver.resolve(command);
        final updated = modeAfter(mode, commandResult);
        if (updated != null) mode = updated;
      });
    }
  }

  @override
  @protected
  void handlePointerDown(PointerDownGesture gesture) {
    final latLng = camera.worldOffsetToLatLng(gesture.offset);
    _apply(gesture_handler.handlePointerDown(mode, gesture, latLng));
  }

  @override
  @protected
  void handleDragStart(DragStartGesture gesture) {
    _apply(gesture_handler.handleDragStart(mode, gesture));
  }

  @override
  @protected
  void handleDragEnd(DragEndGesture gesture) {
    _apply(gesture_handler.handleDragEnd(mode, gesture));
  }

  @override
  @protected
  void handleDragging(DraggingGesture gesture) {
    final latLng = camera.worldOffsetToLatLng(gesture.offset);
    _apply(gesture_handler.handleDragging(mode, gesture, latLng));
  }

  @override
  @protected
  void handleTap(TapGesture gesture) {
    _apply(gesture_handler.handleTap(mode, gesture));
  }

  void executeEffect(Future<void> Function() effect) {
    _effectQueue.add(effect);
  }

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
        SketchEdition(segmentId: id, path: []);
      case _:
    }
    ;
  }

  void stopSketch() {
    mode = const Idle();
  }

  void deleteSelected() => _apply(gesture_handler.deleteSelection(mode));
  void changeSegmentType(MobilityType t) =>
      _apply(gesture_handler.changeSelectedSegmentType(mode, t));
}
