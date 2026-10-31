import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/gesture_engine/map_pointer_event.dart';

sealed class PointerGestureState {
  const PointerGestureState();
}

class IdleState extends PointerGestureState {
  const IdleState();
}

class PressedState extends PointerGestureState {
  const PressedState({required this.hit, required this.pressPosition});
  final HitObject? hit;
  final PointerPosition pressPosition;
  MapObject? get element => hit?.object; // le reste du code ne change pas
}

/// Le long press a été déclenché, le doigt est toujours posé.
/// Sert à ne PAS émettre de Tap au relâchement.
class LongPressedState extends PointerGestureState {
  const LongPressedState({required this.hit, required this.pressPosition});

  final HitObject? hit;
  final PointerPosition pressPosition;

  MapObject? get element => hit?.object; // le reste du code ne change pas
}

class PendingTap extends PointerGestureState {
  const PendingTap({
    required this.hit,
    required this.pressPosition,
    this.doubleTapMaxDistancePx = 24,
  });

  final HitObject? hit;
  final PointerPosition pressPosition;
  final double doubleTapMaxDistancePx;

  MapObject? get element => hit?.object; // le reste du code ne change pas

  bool compare(MapObject? otherElement, ScreenOffset otherOffset) {
    if ((pressPosition.screen.value - otherOffset.value).distance >
        doubleTapMaxDistancePx) {
      return false;
    }

    if (element == null && otherElement == null) {
      return true;
    }

    if (element == null || otherElement == null) {
      return false;
    }

    return element! == otherElement;
  }
}

class DraggingState extends PointerGestureState {
  const DraggingState({
    required this.source,
    required this.pressPosition,
    this.target,
  });

  /// Saisi au press : objet + point exact. Fixe pendant tout le drag.
  final HitObject source;

  /// Où le doigt s'est posé.
  final PointerPosition pressPosition;

  /// Cible de dépôt sous le doigt, mise à jour à chaque move.
  final HitObject? target;

  MapObject get sourceObject => source.object;

  /// Seul un objet réellement déplacé est exclu du hit-test.
  MapObject? get excluded => sourceObject.isMovedByDrag ? sourceObject : null;

  DraggingState withTarget(HitObject? target) => DraggingState(
    source: source,
    pressPosition: pressPosition,
    target: target,
  );
}

class PanningState extends PointerGestureState {
  const PanningState();
}
