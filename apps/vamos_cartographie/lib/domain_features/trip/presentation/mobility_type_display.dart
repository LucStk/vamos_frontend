// apps/vamos_cartographie/lib/domain_features/trip/presentation/mobility_type_display.dart
import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/ui_kit/ui_kit.dart';

extension ExtMobilityTypeStyle on MobilitySpanFields {
  MobilityTypeStyle get mobilityTypeDisplay => mobilityType.display;
}

extension ExtMobilityType on MobilityType {
  MobilityTypeStyle get display => MobilityTypeStyle.from(this);
}

/// Source de vérité unique de l'apparence d'un [MobilityType] : widgets ET carte.
///
/// - Widgets : `Icon(style.icon, color: style.color)`.
/// - Carte (canvas) : `MobilityAppearances` dérive glyphe, couleur et pointillé
///   d'ici. Ne duplique rien ailleurs.
///
/// `icon` et `svgPath` doivent représenter la MÊME icône (famille Material
/// Icons, grille 24 x 24). Quand tu changes l'une, change l'autre.
enum MobilityTypeStyle implements MapItemStyle {
  bike(
    label: 'Vélo',
    icon: Icons.directions_bike,
    svgPath:
        'M15.5 5.5c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zM5 12c-2.8 0-5 2.2-5 5s2.2 5 5 5 5-2.2 5-5-2.2-5-5-5zm0 8.5c-1.9 0-3.5-1.6-3.5-3.5s1.6-3.5 3.5-3.5 3.5 1.6 3.5 3.5-1.6 3.5-3.5 3.5zm5.8-10l2.4-2.4.8.8c1.3 1.3 3 2.1 5.1 2.1V9c-1.5 0-2.7-.6-3.6-1.5l-1.9-1.9c-.5-.4-1-.6-1.6-.6s-1.1.2-1.4.6L7.8 8.4c-.4.4-.6.9-.6 1.4 0 .6.2 1.1.6 1.4L11 14v5h2v-6.2l-2.2-2.3zM19 12c-2.8 0-5 2.2-5 5s2.2 5 5 5 5-2.2 5-5-2.2-5-5-5zm0 8.5c-1.9 0-3.5-1.6-3.5-3.5s1.6-3.5 3.5-3.5 3.5 1.6 3.5 3.5-1.6 3.5-3.5 3.5z',
    colorValue: 0xFF2196F3,
    isDashed: false,
    type: MobilityType.bike,
  ),
  car(
    label: 'Voiture',
    icon: Icons.directions_car,
    svgPath:
        'M18.92 6.01C18.72 5.42 18.16 5 17.5 5h-11c-.66 0-1.21.42-1.42 1.01L3 12v8c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-1h12v1c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-8l-2.08-5.99zM6.5 16c-.83 0-1.5-.67-1.5-1.5S5.67 13 6.5 13s1.5.67 1.5 1.5S7.33 16 6.5 16zm11 0c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5zM5 11l1.5-4.5h11L19 11H5z',
    colorValue: 0xFF9E9E9E,
    isDashed: false,
    type: MobilityType.car,
  ),
  boat(
    label: 'Bateau',
    icon: Icons.directions_boat,
    svgPath:
        'M20 21c-1.39 0-2.78-.47-4-1.32-2.44 1.71-5.56 1.71-8 0C6.78 20.53 5.39 21 4 21H2v2h2c1.38 0 2.74-.35 4-.99 2.52 1.29 5.48 1.29 8 0 1.26.65 2.62.99 4 .99h2v-2h-2zM3.95 19H4c1.6 0 3.02-.88 4-2 .98 1.12 2.4 2 4 2s3.02-.88 4-2c.98 1.12 2.4 2 4 2h.05l1.89-6.68c.08-.26.06-.54-.06-.78s-.34-.42-.6-.5L20 10.62V6c0-1.1-.9-2-2-2h-3V1H9v3H6c-1.1 0-2 .9-2 2v4.62l-1.29.42c-.26.08-.48.26-.6.5s-.15.52-.06.78L3.95 19zM6 6h12v3.97L12 8 6 9.97V6z',
    colorValue: 0xFF3F51B5,
    isDashed: true,
    type: MobilityType.boat,
  ),
  walk(
    label: 'Marche',
    icon: Icons.directions_walk,
    svgPath:
        'M13.5 5.5c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zM9.8 8.9L7 23h2.1l1.8-8 2.1 2v6h2v-7.5l-2.1-2 .6-3C14.8 12 16.8 13 19 13v-2c-1.9 0-3.5-1-4.3-2.4l-1-1.6c-.4-.6-1-1-1.7-1-.3 0-.5.1-.8.1L6 8.3V13h2V9.6l1.8-.7',
    colorValue: 0xFF4CAF50,
    isDashed: false,
    type: MobilityType.walk,
  ),
  train(
    label: 'Train',
    icon: Icons.train,
    svgPath:
        'M12 2c-4 0-8 .5-8 4v9.5C4 17.43 5.57 19 7.5 19L6 20.5v.5h2.23l2-2H14l2 2h2v-.5L16.5 19c1.93 0 3.5-1.57 3.5-3.5V6c0-3.5-3.58-4-8-4zM7.5 17c-.83 0-1.5-.67-1.5-1.5S6.67 14 7.5 14s1.5.67 1.5 1.5S8.33 17 7.5 17zm3.5-7H6V6h5v4zm2 0V6h5v4h-5zm3.5 7c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5z',
    colorValue: 0xFFF44336,
    isDashed: true,
    type: MobilityType.train,
  );

  const MobilityTypeStyle({
    required this.label,
    required this.icon,
    required this.svgPath,
    required this.colorValue,
    required this.isDashed,
    required this.type,
  });

  @override
  final String label;
  @override
  final IconData icon;
  @override
  final int colorValue;

  /// Tracé SVG de l'icône (grille 24 x 24), utilisé pour dessiner sur la carte.
  /// Volontairement une simple `String` : pas de dépendance à `map_canvas` ici.
  final String svgPath;
  final bool isDashed;
  final MobilityType type;

  Color get color => Color(colorValue);

  static final _byType = {for (final s in values) s.type: s};

  static MobilityTypeStyle from(MobilityType type) => _byType[type]!;
}
