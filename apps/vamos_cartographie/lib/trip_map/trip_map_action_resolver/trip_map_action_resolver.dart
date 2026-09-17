import 'package:map_canvas/domain/gesture_resolver_type.dart';
import 'package:map_engine/map_engine.dart';
import 'gestures_resolver.dart';

class TripMapGestureActionResolver implements GestureActionResolver {
  const TripMapGestureActionResolver({
    required this.onResolution,
    required this.context,
  });

  final void Function(GestureResolution resolution) onResolution;
  final GestureResolutionContext context;

  @override
  void resolve(PointerGestureAction? action) {
    final resolution = GestureResolution.resolve(action, context);

    onResolution(resolution);
  }
}
