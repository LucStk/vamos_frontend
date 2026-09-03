// lib/editor/map_editor.dart
import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:map_application/effects/map_effects.dart';
import 'package:trip_application/topology/application/graph_editor.dart';
import 'package:trip_application/waypoint/application/waypoint_editor.dart';
import 'entities/entities.dart';

// lib/editor/map_editor.dart

mixin MapEditor {
  GraphEditor get graphEditor;
  WaypointEditor get waypointEditor;
  MapMode get mode;
  set mode(MapMode value);
  MapElement get selection;
  set selection(MapElement value);

  MapCameraController? _cameraController;

  /// À appeler une seule fois, dès que le vrai contrôleur de carte existe
  /// côté Flutter (typiquement dans initState du widget hôte).
  void attachCamera(MapCameraController controller) =>
      _cameraController = controller;

  MapCameraController get camera =>
      _cameraController ??
      (throw StateError(
        'camera non attachée — attachCamera() doit être appelé avant tout usage',
      ));

  Future<void> runEffect(MapEffect effect) => effect.run(this);
}

abstract class MapCameraController {
  void zoomTo(LatLng latLng, {double deltaZoom});
}
