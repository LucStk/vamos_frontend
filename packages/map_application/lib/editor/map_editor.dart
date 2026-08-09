// lib/editor/map_editor.dart
import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:map_application/map_effects.dart';
import 'package:trip_application/topology/application/graph_editor.dart';
import 'package:trip_application/waypoint/application/waypoint_editor.dart';
import 'entities/entities.dart';

// lib/editor/map_editor.dart
mixin MapEditor {
  GraphEditor get graphEditor;
  WaypointEditor get waypointEditor;
  MapMode get mode;
  set mode(MapMode value);

  MapSelection get selection;
  set selection(MapSelection value);

  // Raccourci pratique — évite le .run(this) partout dans les extensions
  Future<void> runEffect(MapEffect effect) => effect.run(this);
}
