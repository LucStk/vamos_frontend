import 'package:flutter/material.dart';

/// Une statistique affichable : tuile dans la page compacte, ligne dans la
/// page dépliée. Chaque entité n'a qu'à fournir sa liste de [StatItem].
class StatItem {
  const StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;
}

/// 850 m, 4.2 km, 37 km.
String formatDistance(double? meters) {
  if (meters == null) return '—';
  if (meters < 1000) return '${meters.round()} m';
  final km = meters / 1000;
  return '${km.toStringAsFixed(km < 10 ? 1 : 0)} km';
}
