import 'dart:math' as math;

import 'package:domain_core/domain_core.dart';

/// Tuile Web Mercator (z/x/y), même numérotation que les tuiles de carte.
///
/// Le serveur choisit les voyages tuile par tuile : c'est l'unité de cache,
/// ici comme côté serveur. Une tuile est choisie pour faire 1 à 2 fois la
/// taille de l'écran ([levelFor]) : le serveur mesure ce qu'un voyage occupe
/// à cette échelle.
final class DiscoveryTile {
  const DiscoveryTile(this.z, this.x, this.y);

  final int z;
  final int x;
  final int y;

  static const maxLevel = 18;

  /// Marge autour d'un niveau avant d'en changer (en niveaux) : un zoom qui
  /// oscille autour d'une frontière ne recharge pas tout à chaque geste.
  static const hysteresis = 0.3;

  static const _maxLat = 85.05112878; // limite de la projection Mercator

  /// Niveau des tuiles pour un écran dont le plus grand côté fait
  /// [viewportMaxPx] au zoom [zoom] : une tuile y fait 1 à 2 fois ce côté,
  /// la vue est donc couverte par 2 × 2 tuiles au plus.
  ///
  /// [current] : niveau en cours, gardé tant que le zoom reste à moins de
  /// [hysteresis] niveau de sa plage.
  static int levelFor({
    required double zoom,
    required double viewportMaxPx,
    int? current,
  }) {
    final raw = zoom - math.log(math.max(viewportMaxPx, 256) / 256) / math.ln2;
    if (current != null &&
        raw >= current - hysteresis &&
        raw < current + 1 + hysteresis) {
      return current;
    }
    return raw.floor().clamp(0, maxLevel);
  }

  /// Les tuiles de niveau [z] qui couvrent [bounds], de l'ouest à l'est puis
  /// du nord au sud. Gère une vue à cheval sur l'antiméridien (west > east).
  static List<DiscoveryTile> covering(MapLatLngBounds bounds, int z) {
    final n = 1 << z;
    final top = _tileY(bounds.north, n);
    final bottom = _tileY(bounds.south, n);
    final west = _tileX(bounds.west, n);
    final east = _tileX(bounds.east, n);
    final columns = bounds.west <= bounds.east
        ? [for (var x = west; x <= east; x++) x]
        : [for (var x = west; x < n; x++) x, for (var x = 0; x <= east; x++) x];
    return [
      for (var y = top; y <= bottom; y++)
        for (final x in columns) DiscoveryTile(z, x, y),
    ];
  }

  DiscoveryTile? get parent =>
      z == 0 ? null : DiscoveryTile(z - 1, x >> 1, y >> 1);

  List<DiscoveryTile> get children => [
    for (var dy = 0; dy < 2; dy++)
      for (var dx = 0; dx < 2; dx++)
        DiscoveryTile(z + 1, 2 * x + dx, 2 * y + dy),
  ];

  static int _tileX(double lng, int n) {
    final wrapped = ((lng + 180) % 360 + 360) % 360; // [0, 360)
    return (wrapped / 360 * n).floor().clamp(0, n - 1);
  }

  static int _tileY(double lat, int n) {
    final rad = lat.clamp(-_maxLat, _maxLat) * math.pi / 180;
    final y = (1 - math.log(math.tan(rad) + 1 / math.cos(rad)) / math.pi) / 2;
    return (y * n).floor().clamp(0, n - 1);
  }

  @override
  bool operator ==(Object other) =>
      other is DiscoveryTile && other.z == z && other.x == x && other.y == y;

  @override
  int get hashCode => Object.hash(z, x, y);

  @override
  String toString() => 'DiscoveryTile($z/$x/$y)';
}
