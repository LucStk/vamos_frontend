export 'drag_resolver.dart';
export 'pointer_down_resolver.dart';
export 'tap_resolver.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/trip_map/domain/domain.dart';
import 'package:vamos_cartographie/trip_map/effects/map_effects.dart';
import 'package:vamos_cartographie/trip_map/transitions/trip_map_state_transitions.dart';

class GesturesResolverContext {
  const GesturesResolverContext({
    required this.editorState,
    required this.camera,
    required this.mapTransitions,
  });

  final TripMapState editorState;
  final MapCameraReader camera;
  final TripMapStateTransitions mapTransitions;
}

class GestureResolution {
  const GestureResolution({required this.editorState, this.effects = const []});

  final TripMapState editorState;
  final List<MapEffect> effects;
}
