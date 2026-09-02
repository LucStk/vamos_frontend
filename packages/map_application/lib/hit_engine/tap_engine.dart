import 'dart:async';
import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';

/// Détecte les taps simples et doubles, indépendamment de Flutter,
/// de MapHitTester et de MapEditor. Ne connaît que ce qu'on lui injecte.
class TapEngine {
  final Point<double> Function(LatLng) project;
  final void Function(MapElement element, LatLng latLng) onTap;
  final void Function(MapElement element, LatLng latLng) onDoubleTap;
  final Duration doubleTapTimeout;
  final double doubleTapMaxDistancePx;

  /// Détermine si un élément doit attendre le délai de double tap
  /// avant de déclencher onTap. Par défaut, tous les éléments attendent
  /// (comportement historique). Retourner `false` pour un élément fait
  /// déclencher onTap immédiatement, sans attendre un éventuel second tap.
  final bool Function(MapElement element) awaitsDoubleTap;

  TapEngine({
    required this.project,
    required this.onTap,
    required this.onDoubleTap,
    this.doubleTapTimeout = const Duration(milliseconds: 300),
    this.doubleTapMaxDistancePx = 24,
    required this.awaitsDoubleTap,
  });

  Timer? _pendingTapTimer;
  Point<double>? _pendingTapPoint;
  MapElement? _pendingTapElement;

  void handleTap(MapElement element, LatLng latLng) {
    if (!awaitsDoubleTap(element)) {
      // Élément exempté du double tap : on annule tout tap en attente
      // sur un autre élément (pour ne pas laisser un double tap fantôme
      // se déclencher plus tard sur cet ancien élément) et on déclenche
      // immédiatement, sans latence.
      cancelPendingTap();
      onTap(element, latLng);
      return;
    }

    final point = project(latLng);

    final isDouble =
        _pendingTapTimer != null &&
        _pendingTapElement != null &&
        isSameHitTarget(_pendingTapElement!, element) &&
        _distancePx(_pendingTapPoint!, point) <= doubleTapMaxDistancePx;

    if (isDouble) {
      cancelPendingTap();
      onDoubleTap(element, latLng);
      return;
    }

    cancelPendingTap();
    _pendingTapPoint = point;
    _pendingTapElement = element;
    _pendingTapTimer = Timer(doubleTapTimeout, () {
      onTap(element, latLng);
      _pendingTapTimer = null;
      _pendingTapPoint = null;
      _pendingTapElement = null;
    });
  }

  void cancelPendingTap() {
    _pendingTapTimer?.cancel();
    _pendingTapTimer = null;
    _pendingTapPoint = null;
    _pendingTapElement = null;
  }

  void dispose() => cancelPendingTap();

  double _distancePx(Point<double> a, Point<double> b) =>
      sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
}
