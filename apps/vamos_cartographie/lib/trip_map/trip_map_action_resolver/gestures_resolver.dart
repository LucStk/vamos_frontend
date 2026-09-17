export 'drag_resolver.dart';
export 'pointer_down_resolver.dart';
export 'tap_resolver.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/trip_map/domain/domain.dart';
import 'package:vamos_cartographie/trip_map/effects/map_effects.dart';
import 'package:vamos_cartographie/trip_map/transitions/trip_map_state_transitions.dart';

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

class GestureResolution {
  const GestureResolution({required this.editorState, this.effects = const []});

  final TripMapState editorState;
  final List<MapEffectImpl> effects;

  factory GestureResolution.resolve(
    PointerGestureAction? action,
    GestureResolutionContext context,
  ) {
    // print("action $action");
    return switch (action) {
      PointerDownAction action => action.resolve(context),
      TapAction action => action.resolve(context),
      DoubleTapAction action => action.resolve(context),
      DragStartAction action => action.resolve(context),
      DragUpdateAction action => action.resolve(context),
      DragEndAction action => action.resolve(context),
      null => GestureResolution(editorState: context.editorState),
    };
  }
}
