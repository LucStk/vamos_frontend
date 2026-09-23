import '/domain/domain.dart';
import "application.dart";

typedef OnGesture = void Function(MapGesture gesture);

class MapGestureHandler {
  MapGestureHandler({required HitTest hitTest, required this.onGesture})
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
  final OnGesture onGesture;

  late final PendingTapTimer _pendingTapTimer;

  void resolve(PointerEventType event, WorldOffset offset) {
    final gesture = gestureResolver.resolve(event, offset);

    if (gesture != null) {
      onGesture(gesture);
    }

    // Après CHAQUE event, on resynchronise le timer sur l'état réel
    // du resolver — plutôt que d'essayer de deviner depuis `gesture`.
    final state = gestureResolver.state;
    if (state is PendingTap) {
      _pendingTapTimer.update(state);
    } else {
      _pendingTapTimer.cancel();
    }
  }

  void _onTapTimeout(PendingTap pending) {
    final gesture = gestureResolver.resolve(
      PointerEventType.tapTimeout,
      pending.offset,
    );
    if (gesture != null) {
      onGesture(gesture);
    }
  }

  void dispose() {
    _pendingTapTimer.dispose();
  }
}
