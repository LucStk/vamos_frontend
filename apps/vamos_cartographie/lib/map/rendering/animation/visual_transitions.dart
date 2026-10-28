import 'package:flutter/scheduler.dart';
import 'package:map_canvas/map_canvas.dart';

import 'transition_hub.dart';

/// Intensité visuelle d'un état : plus c'est haut, plus l'objet est « ouvert ».
int _rank(MapObjectVisualState s) => switch (s) {
  MapObjectVisualState.normal => 0,
  MapObjectVisualState.hovered => 1,
  MapObjectVisualState.selected => 2,
  MapObjectVisualState.dragging => 3,
};

bool defaultIsOpening(MapObjectVisualState from, MapObjectVisualState to) =>
    _rank(to) > _rank(from);

class _Visual {
  _Visual(this.state) : from = state;
  MapObjectVisualState from, state;
  Duration? startedAt; // null = pas de transition
  Duration duration = Duration.zero; // durée de la transition en cours
  MapPaintContext? previous; // transition interrompue, figée
  int chain = 0; // profondeur de `previous`
}

class VisualTransitions {
  VisualTransitions(
    TickerProvider vsync, {
    this.isOpening = defaultIsOpening,
    this.openDuration = const Duration(milliseconds: 160),
    this.closeDuration = const Duration(milliseconds: 80),
  }) {
    _ticker = vsync.createTicker(_onTick);
    _clock.start();
  }

  final Duration openDuration;
  final Duration closeDuration;
  final bool Function(MapObjectVisualState from, MapObjectVisualState to)
  isOpening;

  /// Profondeur max des interruptions chaînées. Au-delà, on tronque
  /// (léger saut possible) pour garder `resolve` peu coûteux.
  static const _maxChain = 4;

  late final Ticker _ticker;
  final _clock = Stopwatch();
  final _visuals = <Object, _Visual>{};

  final ticks = TransitionHub();

  int _version = 0;
  List<SceneItem>? _cachedItems;
  int _cachedVersion = -1;
  List<DrawCommand> _cached = const [];

  // ---- Boucle continue (chargement) ----

  bool _looping = false;

  /// Tant que c'est vrai, le ticker tourne et les commandes sont recalculées
  /// à chaque frame. À éteindre dès que plus rien n'est animé en continu.
  set looping(bool on) {
    if (on == _looping) return;
    _looping = on;
    _version++; // invalide le cache de commandsFor
    ticks.pulse();
    if (on && !_ticker.isActive) _ticker.start();
    // À l'extinction, le prochain _onTick arrête le ticker.
  }

  bool get looping => _looping;

  double get _time => _clock.elapsed.inMicroseconds / 1e6;

  // ---- Transitions finies ----

  double _progress(_Visual v, Duration now) {
    final started = v.startedAt;
    if (started == null) return 1;
    return ((now - started).inMicroseconds / v.duration.inMicroseconds).clamp(
      0.0,
      1.0,
    );
  }

  void setTargets(Map<Object, MapObjectVisualState> targets) {
    final now = _clock.elapsed;
    var changed = false;

    for (final e in targets.entries) {
      final v = _visuals[e.key];
      if (v == null) {
        _visuals[e.key] = _Visual(e.value); // nouvel objet : pas d'animation
      } else if (v.state != e.value) {
        final t = _progress(v, now);

        if (t < 1) {
          // Transition en cours : on fige son état actuel comme départ.
          final keep = v.previous != null && v.chain < _maxChain;
          v.previous = MapPaintContext(
            from: v.from,
            state: v.state,
            t: t,
            previous: keep ? v.previous : null,
          );
          v.chain = keep ? v.chain + 1 : 1;
        } else {
          v.previous = null;
          v.chain = 0;
        }

        v.duration = isOpening(v.state, e.value) ? openDuration : closeDuration;
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
    // L'horloge n'avance pour les styles que pendant la boucle : hors boucle,
    // `time` vaut 0 (= « horloge arrêtée »).
    final time = _looping ? _time : 0.0;

    final v = _visuals[key];
    if (v == null) return MapPaintContext(time: time);
    if (v.startedAt == null) return MapPaintContext(state: v.state, time: time);

    final t = _progress(v, _clock.elapsed);
    return t >= 1
        ? MapPaintContext(state: v.state, time: time)
        : MapPaintContext(
            from: v.from,
            state: v.state,
            t: t,
            previous: v.previous,
            time: time,
          );
  }

  List<DrawCommand> commandsFor(List<SceneItem> items) {
    if (identical(items, _cachedItems) && _cachedVersion == _version) {
      return _cached;
    }
    _cachedItems = items;
    _cachedVersion = _version;
    return _cached = [
      for (final item in items.reversed)
        item.toDrawCommand(context: contextOf(item.object)),
    ];
  }

  void _onTick(Duration _) {
    final now = _clock.elapsed;
    var running = false;
    for (final v in _visuals.values) {
      final s = v.startedAt;
      if (s == null) continue;
      if (now - s >= v.duration) {
        v.startedAt = null; // terminé
        v.previous = null;
        v.chain = 0;
      } else {
        running = true;
      }
    }
    _version++;
    ticks.pulse();
    if (!running && !_looping) _ticker.stop();
  }

  void dispose() {
    _ticker.dispose();
    ticks.dispose();
  }
}
