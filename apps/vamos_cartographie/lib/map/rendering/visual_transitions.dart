import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:map_canvas/map_canvas.dart';

/// Enveloppe Flutter de [VisualAnimator] : fournit l'horloge, le ticker,
/// la boucle continue et le cache des commandes de dessin.
///
/// C'est aussi le `Listenable` du painter (`repaint: transitions`) : il
/// notifie à chaque tick et à chaque changement de cibles.
class VisualTransitions extends ChangeNotifier {
  VisualTransitions(
    TickerProvider vsync, {
    Duration openDuration = const Duration(milliseconds: 160),
    Duration closeDuration = const Duration(milliseconds: 80),
    Curve curve = Curves.easeOut,
  }) : _animator = VisualAnimator(
         openDuration: openDuration,
         closeDuration: closeDuration,
         easing: curve.transform,
       ) {
    _ticker = vsync.createTicker(_onTick);
    _clock.start();
  }

  final VisualAnimator _animator;
  late final Ticker _ticker;
  final _clock = Stopwatch();

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
    notifyListeners();
    if (on && !_ticker.isActive) _ticker.start();
    // À l'extinction, le prochain _onTick arrête le ticker.
  }

  bool get looping => _looping;

  double get _time => _clock.elapsed.inMicroseconds / 1e6;

  // ---- Cibles ----

  /// Voir [VisualAnimator.setTargets].
  void setTargets(
    Map<Object, Set<VisualTrait>> targets, {
    bool animate = true,
  }) {
    if (!_animator.setTargets(targets, _clock.elapsed, animate: animate)) {
      return;
    }
    _version++;
    notifyListeners();
    if (!_ticker.isActive) _ticker.start();
  }

  // ---- Lecture ----

  MapPaintContext contextOf(Object key) => MapPaintContext(
    weights: _animator.weightsOf(key, _clock.elapsed),
    time: _looping ? _time : 0.0,
  );

  List<DrawCommand> commandsFor(List<SceneItem> items) {
    if (identical(items, _cachedItems) && _cachedVersion == _version) {
      return _cached;
    }
    _cachedItems = items;
    _cachedVersion = _version;

    // Un seul instant pour toute la frame : ordre et looks cohérents.
    final now = _clock.elapsed;
    // Hors boucle, `time` vaut 0 (= « horloge arrêtée »).
    final time = _looping ? _time : 0.0;
    final ordered = elevateActive(items, (key) => _animator.isActive(key, now));

    return _cached = [
      for (final item in ordered.reversed)
        item.toDrawCommand(
          context: MapPaintContext(
            weights: _animator.weightsOf(item.object, now),
            time: time,
          ),
        ),
    ];
  }

  void _onTick(Duration _) {
    final running = _animator.advance(_clock.elapsed);
    _version++;
    notifyListeners();
    if (!running && !_looping) _ticker.stop();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}
