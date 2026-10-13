// command/scopes.dart
import 'package:domain_core/domain/collection_store.dart';
import 'package:trip_application/trip_application.dart';

import '../../camera/camera_director.dart';
import '../../domain/camera/map_camera.dart';

// Scopes : interfaces abstraites, dans une couche basse
abstract interface class CommonScope {
  CameraDirector get director;
}

abstract interface class WaypointScope implements CommonScope {
  WaypointEditor get waypointEditor;
}

abstract interface class TopologyScope implements CommonScope {
  GraphEditor get graphEditor;
  MapCameraController get camera;
  SegmentFields? segment(SegmentId id) =>
      graphEditor.state.segmentStore.get(id)?.current;
}

abstract interface class EditorScope implements CommonScope {
  GraphEditor get graphEditor;
  WaypointEditor get waypointEditor;
  MapCameraController get camera;
}
