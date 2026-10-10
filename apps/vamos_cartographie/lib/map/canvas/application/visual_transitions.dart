import 'package:flutter/scheduler.dart';
import 'package:map_canvas/map_canvas.dart';

import 'transition_hub.dart';

class _Visual {
  _Visual(this.state) : from = state;
  MapObjectVisualState from, state;
  Duration? startedAt; // null = pas de transition
}

class VisualTransitions {
  VisualTransitions(
    TickerProvider vsync, {
    this.duration = const Duration(milliseconds: 100),
  }) {
    _ticker = vsync.createTicker(_onTick);
    _clock.start();
  }

  final Duration duration;
  late final Ticker _ticker;
  final _clock = Stopwatch();
  final _visuals = <Object, _Visual>{};

  /// Notifie à chaque frame d'animation : sert de `repaint:` aux painters.
  final ticks = TransitionHub();

  // Cache des commandes : valable tant que rien n'a bougé (même items, même version).
  int _version = 0;
  List<SceneItem>? _cachedItems;
  int _cachedVersion = -1;
  List<DrawCommand> _cached = const [];

  void setTargets(Map<Object, MapObjectVisualState> targets) {
    final now = _clock.elapsed;
    var changed = false;

    for (final e in targets.entries) {
      final v = _visuals[e.key];
      if (v == null) {
        _visuals[e.key] = _Visual(e.value); // nouvel objet : pas d'animation
      } else if (v.state != e.value) {
        v.from = v.state;
        v.state = e.value;
        v.startedAt = now;
        changed = true;
      }
    }
    _visuals.removeWhere((k, _) => !targets.containsKey(k));

    if (!changed) return;
    _version++;
    ticks.pulse();
    if (!_ticker.isActive) _ticker.start();
  }

  MapPaintContext contextOf(Object key) {
    final v = _visuals[key];
    final started = v?.startedAt;
    if (v == null) return const MapPaintContext();
    if (started == null) return MapPaintContext(state: v.state);

    final t =
        (_clock.elapsed - started).inMicroseconds / duration.inMicroseconds;
    return t >= 1
        ? MapPaintContext(state: v.state)
        : MapPaintContext(from: v.from, state: v.state, t: t);
  }

  /// Commandes de dessin, calculées une fois par frame et partagées
  /// entre les deux passes (invariante et dépendante du zoom).
  List<DrawCommand> commandsFor(List<SceneItem> items) {
    if (identical(items, _cachedItems) && _cachedVersion == _version) {
      return _cached;
    }
    _cachedItems = items;
    _cachedVersion = _version;
    return _cached = [
      for (final item in items.reversed)
        item.toDrawCommand(context: contextOf(item.object.stableId)),
    ];
  }

  void _onTick(Duration _) {
    final now = _clock.elapsed;
    var running = false;
    for (final v in _visuals.values) {
      final s = v.startedAt;
      if (s == null) continue;
      if (now - s >= duration) {
        v.startedAt = null; // terminé
      } else {
        running = true;
      }
    }
    _version++;
    ticks.pulse();
    if (!running) _ticker.stop();
  }

  void dispose() {
    _ticker.dispose();
    ticks.dispose();
  }
}
