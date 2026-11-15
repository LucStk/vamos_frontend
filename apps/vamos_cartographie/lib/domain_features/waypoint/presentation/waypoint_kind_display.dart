// apps/vamos_cartographie/lib/domain_features/waypoint/presentation/waypoint_kind_display.dart
import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/ui_kit/ui_kit.dart';

extension ExtWaypointKind on WaypointKind? {
  /// Style d'une catégorie ; `null` (non catégorisé) donne [WaypointKindStyle.none].
  WaypointKindStyle get display => WaypointKindStyle.from(this);
}

extension ExtWaypointDisplay on WaypointFields {
  /// Apparence d'un waypoint sur la carte et dans les listes.
  /// Une halte l'emporte sur la catégorie : dormir est l'information principale.
  WaypointKindStyle get display =>
      stay != null ? WaypointKindStyle.stay : kind.display;
}

/// Source de vérité unique de l'apparence d'un waypoint : widgets ET carte.
///
/// - Widgets : `Icon(style.icon, color: style.color)`.
/// - Carte (canvas) : glyphe et couleur dérivés d'ici. Ne duplique rien ailleurs.
///
/// `icon` et `svgPath` doivent représenter la MÊME icône (famille Material
/// Icons, grille 24 x 24). Quand tu changes l'une, change l'autre.
///
/// Couleurs choisies distinctes de [MobilityTypeStyle] : les marqueurs sont
/// dessinés par-dessus les tracés.
enum WaypointKindStyle implements MapItemStyle {
  resupply(
    label: 'Ravitaillement',
    icon: Icons.shopping_basket,
    svgPath:
        'M17.21 9l-4.38-6.56c-.19-.28-.51-.42-.83-.42-.32 0-.64.14-.83.43L6.79 9H2c-.55 0-1 .45-1 1 0 .09.01.18.04.27l2.54 9.27c.23.84 1 1.46 1.92 1.46h13c.92 0 1.69-.62 1.93-1.46l2.54-9.27L23 10c0-.55-.45-1-1-1h-4.79zM9 9l3-4.4L15 9H9zm3 8c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z',
    colorValue: 0xFF009688,
    kind: WaypointKind.resupply,
  ),
  eat(
    label: 'Repas',
    icon: Icons.restaurant,
    svgPath:
        'M11 9H9V2H7v7H5V2H3v7c0 2.12 1.66 3.84 3.75 3.97V22h2.5v-9.03C11.34 12.84 13 11.12 13 9V2h-2v7zm5-3v8h2.5v8H21V2c-2.76 0-5 2.24-5 4z',
    colorValue: 0xFFFF9800,
    kind: WaypointKind.eat,
  ),
  repair(
    label: 'Réparation',
    icon: Icons.build,
    svgPath:
        'M22.7 19l-9.1-9.1c.9-2.3.4-5-1.5-6.9-2-2-5-2.4-7.4-1.3L9 6 6 9 1.6 4.7C.4 7.1.9 10.1 2.9 12.1c1.9 1.9 4.6 2.4 6.9 1.5l9.1 9.1c.4.4 1 .4 1.4 0l2.3-2.3c.5-.4.5-1.1.1-1.4z',
    colorValue: 0xFF607D8B,
    kind: WaypointKind.repair,
  ),
  sightsee(
    label: 'Visite',
    icon: Icons.landscape,
    svgPath:
        'M14 6l-3.75 5 2.85 3.8-1.6 1.2C9.81 13.75 7 10 7 10l-6 8h22L14 6z',
    colorValue: 0xFF9C27B0,
    kind: WaypointKind.sightsee,
  ),

  /// Waypoint sans catégorie (`kind == null`).
  none(
    label: 'Aucune',
    icon: Icons.place,
    svgPath:
        'M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z',
    colorValue: 0xFF757575,
    kind: null,
  ),

  /// Halte de nuit. Ce n'est PAS une catégorie : jamais renvoyé par [from],
  /// seulement par `WaypointFields.display` quand le waypoint a un `stay`.
  stay(
    label: 'Halte',
    icon: Icons.hotel,
    svgPath:
        'M7 13c1.66 0 3-1.34 3-3S8.66 7 7 7s-3 1.34-3 3 1.34 3 3 3zm12-6h-8v7H3V5H1v15h2v-3h18v3h2v-9c0-2.21-1.79-4-4-4z',
    colorValue: 0xFF5D4037,
    kind: null,
  );

  const WaypointKindStyle({
    required this.label,
    required this.icon,
    required this.svgPath,
    required this.colorValue,
    required this.kind,
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

  /// Catégorie représentée ; `null` pour [none] et [stay].
  final WaypointKind? kind;

  Color get color => Color(colorValue);

  /// Choix proposés à l'utilisateur, dans l'ordre d'affichage : « Aucune » puis
  /// les catégories. La halte n'en fait pas partie (elle se règle à part).
  static const selectable = [none, resupply, eat, repair, sightsee];

  static final _byKind = {
    for (final s in values)
      if (s != stay) s.kind: s,
  };

  static WaypointKindStyle from(WaypointKind? kind) => _byKind[kind]!;
}
