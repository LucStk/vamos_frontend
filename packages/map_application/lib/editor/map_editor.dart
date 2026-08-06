// lib/editor/map_editor.dart
import 'package:map_application/commands/map_command.dart';
import 'package:map_application/map_application.dart';
import 'drag_editor.dart';
import 'segment_editor.dart';
import 'vertex_editor.dart';

// lib/editor/map_editor.dart
mixin MapEditor implements MapEffectContext {
  MapState get state;
  set state(MapState value);

  Future<void> handle(MapEvent event) async {
    switch (state.mode) {
      case Idle _:
        await _handleIdle(event);
      case Sketch _:
        await _handleSketch(event);
    }
  }

  // Raccourci pratique — évite le .run(this) partout dans les extensions
  Future<void> runEffect(MapEffect effect) => effect.run(this);

  Future<void> _handleIdle(MapEvent event) async {
    switch (event) {
      case MapTapped e:
        await onMapTapped(e.latLng);
      case DragStartEvent e:
        await onDragStart(e.dragElement);
      case DragUpdateEvent e:
        await onDragUpdate(e.dragElement, e.latLng);
      case DragEndEvent e:
        await onDragEnd(e.dragElement, e.latLng);
      case SegmentInputEvent e:
        await _handleSegmentInput(e);
      case VertexInputEvent e:
        await _handleVertexInput(e);
    }
  }

  Future<void> _handleSegmentInput(SegmentInputEvent event) async {
    switch (event) {
      case SegmentButtonDeleteTapped _:
        await deleteSelectedSegment();
      case SegmentMobilityTypeChanged e:
        await changeSegmentType(e.type);
      case SegmentRedrawButtonTapped e:
        await redrawSegment(e.segmentId);
    }
  }

  Future<void> _handleVertexInput(VertexInputEvent event) async {
    switch (event) {
      case VertexButtonDeleteTapped _:
        await deleteSelectedVertex();
      case VertexButtonCreateWaypoint _:
        await createWaypointFromSelectedVertex();
    }
  }
}
