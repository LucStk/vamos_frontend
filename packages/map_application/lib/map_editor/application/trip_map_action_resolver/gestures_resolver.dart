export 'drag_resolver.dart';
export 'pointer_down_resolver.dart';
export 'tap_resolver.dart';
import 'package:map_engine/map_engine.dart';

import 'gestures_resolver.dart';

class GestureResolutionContext {
  const GestureResolutionContext({
    required this.editorState,
    required this.camera,
    required this.mapTransitions,
  });

  final TripMapState editorState;
  final MapCameraReader camera;
  final TripMapStateTransitions mapTransitions;
}
