// lib/editor/map_editor.dart
import 'package:map_application/map_application.dart';
import 'package:trip_application/topology/application/graph_editor.dart';
import 'package:trip_application/waypoint/application/waypoint_editor.dart';
import 'drag_editor.dart';
import 'tap_editor.dart';
import 'entities/entities.dart';

// lib/editor/map_editor.dart
mixin MapEditor {
  GraphEditor get graphEditor;
  WaypointEditor get waypointEditor;
  MapOutput get mapOutput;
  MapMode get mode;
  set mode(MapMode value);

  MapSelection get selection;
  set selection(MapSelection value);

  Future<void> handle(MapEvent event) async {
    switch (event) {
      case MapTapped e:
        selection = MapSelection.cursor(latLng: e.latLng);
      case TapEvent e:
        await onTapped(e.tappedElement, e.latLng);
      case DragStartEvent e:
        await onDragStart(e.dragElement);
      case DragUpdateEvent e:
        await onDragUpdate(e.dragElement, e.latLng);
      case DragEndEvent e:
        await onDragEnd(e.dragElement, e.latLng);
    }
  }

  // Raccourci pratique — évite le .run(this) partout dans les extensions
  Future<void> runEffect(MapEffect effect) => effect.run(this);
}
