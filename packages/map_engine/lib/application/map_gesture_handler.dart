import '/domain/domain.dart';
import "application.dart";

typedef OnGesture = void Function(MapGesture gesture);

class MapGestureHandler {
  MapGestureHandler({required HitTest hitTest, required this.mode})
    : gestureResolver = PointerGestureResolver(hitTest: hitTest) {
    _pendingTapTimer = PendingTapTimer(onTimeout: _onTapTimeout);
  }
  bool get panAllowed {
    return switch (gestureResolver.state) {
      DraggingState(:final dragged) => dragged == null,
      _ => true,
    };
  }

  final PointerGestureResolver gestureResolver;

  /// Point de sortie unique, que le geste vienne d'un event pointeur
  /// synchrone ou de l'expiration du timer de double-tap.
  final BaseMode mode;

  late final PendingTapTimer _pendingTapTimer;

  GestureResult? resolve(PointerEventType event, ScreenOffset offset) {
    final gesture = gestureResolver.resolve(event, offset);

    if (gesture != null) {
      return mode.dispatchGesture(gesture, offset);
    }

    // Après CHAQUE event, on resynchronise le timer sur l'état réel
    // du resolver — plutôt que d'essayer de deviner depuis `gesture`.
    final state = gestureResolver.state;
    if (state is PendingTap) {
      _pendingTapTimer.update(state);
    } else {
      _pendingTapTimer.cancel();
    }
    return null;
  }

  void _onTapTimeout(PendingTap pending) {
    final gesture = gestureResolver.resolve(
      PointerEventType.tapTimeout,
      pending.offset,
    );
    if (gesture != null) {
      mode.dispatchGesture(gesture, pending.offset);
    }
  }

  void dispose() {
    _pendingTapTimer.dispose();
  }
}
