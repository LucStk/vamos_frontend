import 'dart:ui';

/// Apparence de base, indépendante de l'état visuel. Données pures, sans unité.
final class SegmentAppearance {
  const SegmentAppearance({required this.color, this.dash});

  final Color color;

  /// [trait, vide, trait, vide...] en pixels écran. `null` = trait plein.
  final List<double>? dash;

  static const fallback = SegmentAppearance(color: Color(0xFF9E9E9E));
}
