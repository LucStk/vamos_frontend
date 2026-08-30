import 'dart:async';
import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart'; // MapElement

/// Détecte les taps simples et doubles, indépendamment de Flutter,
/// de MapHitTester et de MapEditor. Ne connaît que ce qu'on lui injecte.
class TapEngine {
  final Point<double> Function(LatLng) project;
  final void Function(MapElement element, LatLng latLng) onTap;
  final void Function(MapElement element, LatLng latLng) onDoubleTap;
  final Duration doubleTapTimeout;
  final double doubleTapMaxDistancePx;

  TapEngine({
    required this.project,
    required this.onTap,
    required this.onDoubleTap,
    this.doubleTapTimeout = const Duration(milliseconds: 300),
    this.doubleTapMaxDistancePx = 24,
  });

  Timer? _pendingTapTimer;
  Point<double>? _pendingTapPoint;
  MapElement? _pendingTapElement;

  void handleTap(MapElement element, LatLng latLng) {
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

    // Pas de double tap en attente compatible : on arme un nouveau tap
    // simple différé, annulé si un second tap valide arrive à temps.
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

  /// À appeler depuis le dispose() du widget hôte.
  void dispose() => cancelPendingTap();

  double _distancePx(Point<double> a, Point<double> b) =>
      sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
}
