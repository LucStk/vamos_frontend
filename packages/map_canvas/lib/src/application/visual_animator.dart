import 'package:map_canvas/src/domain/visual_trait.dart';

/// Fonction d'easing 0..1 → 0..1. Côté Flutter : `Curves.easeOut.transform`.
typedef Easing = double Function(double t);

double linearEasing(double t) => t;

/// Un scalaire animé de 0 à 1. Une nouvelle cible repart toujours de la
/// valeur courante : une interruption ne produit jamais de saut.
class _Axis {
  double _from = 0;
  double _target = 0;
  Duration? _startedAt; // null = au repos
  Duration _duration = Duration.zero;

  double get target => _target;
  bool get isAnimating => _startedAt != null;

  double valueAt(Duration now, Easing easing) {
    final started = _startedAt;
    if (started == null) return _target;
    final total = _duration.inMicroseconds;
    if (total <= 0) return _target;
    final p = ((now - started).inMicroseconds / total).clamp(0.0, 1.0);
    return _from + (_target - _from) * easing(p);
  }

  void jumpTo(double value) {
    _from = value;
    _target = value;
    _startedAt = null;
  }

  /// Vrai si la cible a changé.
  bool retarget(
    double to,
    Duration now, {
    required Duration open,
    required Duration close,
    required Easing easing,
  }) {
    if (to == _target) return false;
    final current = valueAt(now, easing);
    final distance = (to - current).abs();
    _from = current;
    _target = to;
    if (distance == 0) {
      _startedAt = null;
      return true;
    }
    // Durée proportionnelle au chemin restant : une interruption à
    // mi-course ne prend que la moitié du temps.
    _duration = (to > current ? open : close) * distance;
    _startedAt = now;
    return true;
  }

  /// Termine l'animation si elle est échue. Vrai si elle tourne encore.
  bool settle(Duration now) {
    final started = _startedAt;
    if (started == null) return false;
    if (now - started >= _duration) {
      jumpTo(_target);
      return false;
    }
    return true;
  }
}

class _Visual {
  final axes = {for (final t in VisualTrait.values) t: _Axis()};

  VisualWeights weightsAt(Duration now, Easing easing) {
    final values = <VisualTrait, double>{};
    for (final e in axes.entries) {
      final v = e.value.valueAt(now, easing);
      if (v > 0) values[e.key] = v;
    }
    return values.isEmpty ? VisualWeights.none : VisualWeights(values);
  }

  bool isActiveAt(Duration now, Easing easing) =>
      axes.values.any((a) => a.target > 0 || a.valueAt(now, easing) > 0);

  bool get isAtRest =>
      axes.values.every((a) => !a.isAnimating && a.target == 0);
}

/// Animation des traits visuels par objet, sans horloge ni ticker : le temps
/// est toujours passé en argument. Pur Dart, testable sans Flutter.
final class VisualAnimator {
  VisualAnimator({
    this.openDuration = const Duration(milliseconds: 160),
    this.closeDuration = const Duration(milliseconds: 80),
    this.easing = linearEasing,
  });

  /// Durée d'un trait qui passe de 0 à 1.
  final Duration openDuration;

  /// Durée d'un trait qui passe de 1 à 0.
  final Duration closeDuration;

  final Easing easing;

  final _visuals = <Object, _Visual>{};

  /// Un objet absent de [targets] est traité comme sans trait : ses axes
  /// redescendent vers 0 en s'animant, puis son entrée est libérée.
  ///
  /// [animate] à false applique les cibles sans transition (premier rendu).
  /// Vrai si quelque chose a changé.
  bool setTargets(
    Map<Object, Set<VisualTrait>> targets,
    Duration now, {
    bool animate = true,
  }) {
    var changed = false;

    for (final key in targets.keys) {
      _visuals.putIfAbsent(key, _Visual.new);
    }

    for (final entry in _visuals.entries) {
      final traits = targets[entry.key] ?? const <VisualTrait>{};
      for (final axis in entry.value.axes.entries) {
        final to = traits.contains(axis.key) ? 1.0 : 0.0;
        if (animate) {
          if (axis.value.retarget(
            to,
            now,
            open: openDuration,
            close: closeDuration,
            easing: easing,
          )) {
            changed = true;
          }
        } else if (axis.value.target != to || axis.value.isAnimating) {
          axis.value.jumpTo(to);
          changed = true;
        }
      }
    }
    _visuals.removeWhere((_, v) => v.isAtRest);
    return changed;
  }

  /// Termine les animations échues. Vrai si au moins une tourne encore.
  bool advance(Duration now) {
    var running = false;
    for (final v in _visuals.values) {
      for (final axis in v.axes.values) {
        if (axis.settle(now)) running = true;
      }
    }
    _visuals.removeWhere((_, v) => v.isAtRest);
    return running;
  }

  VisualWeights weightsOf(Object key, Duration now) =>
      _visuals[key]?.weightsAt(now, easing) ?? VisualWeights.none;

  bool isActive(Object key, Duration now) =>
      _visuals[key]?.isActiveAt(now, easing) ?? false;
}
