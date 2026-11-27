import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/route/domain/mobility_types.dart';

/// Une catégorie et sa longueur : un type de voie, un revêtement…
///
/// [key] est la valeur stable du serveur (« secondary », « gravel »…), que
/// l'interface traduit.
class WayShare {
  const WayShare({required this.key, required this.lengthM});

  final String key;
  final double lengthM;
}

class ElevationPoint {
  const ElevationPoint({required this.distanceM, required this.elevationM});

  /// Depuis le début des portions de cette modalité, en mètres.
  final double distanceM;
  final double elevationM;
}

/// Profil d'élévation d'un tracé qui n'est pas encore dans la route : la portion
/// d'un aperçu.
class ElevationProfile {
  const ElevationProfile({
    required this.points,
    required this.ascentM,
    required this.descentM,
    required this.minElevationM,
    required this.maxElevationM,
    required this.lengthM,
  });

  final List<ElevationPoint> points;
  final double ascentM;
  final double descentM;
  final double minElevationM;
  final double maxElevationM;
  final double lengthM;

  bool get isDrawable => points.length >= 2;
}

/// Portion de tracé de nature constante : de quoi la colorer selon le type de
/// route. [kind] et [cycle] ont les valeurs de [WayShare.key] ; [kind] vaut
/// « unknown » là où le serveur n'a pas su rattacher le tracé au réseau.
class WaySpan {
  const WaySpan({
    required this.kind,
    required this.cycle,
    required this.lengthM,
    required this.coordinates,
  });

  final String kind;
  final String cycle;
  final double lengthM;
  final List<LatLng> coordinates;
}

/// Ce qu'on sait du parcours fait avec UNE modalité (vélo, marche).
class MobilityInsights {
  const MobilityInsights({
    required this.mobility,
    this.ascentM,
    this.descentM,
    this.minElevationM,
    this.maxElevationM,
    this.profile = const [],
    this.totalM,
    this.analyzedM,
    this.roadKinds = const [],
    this.surfaces = const [],
    this.cycleInfrastructure = const [],
  });

  final MobilityType mobility;

  // Élévation : null si elle n'a pas pu être calculée.
  final double? ascentM;
  final double? descentM;
  final double? minElevationM;
  final double? maxElevationM;
  final List<ElevationPoint> profile;

  // Nature des voies : listes vides si elle n'a pas pu être calculée.
  final double? totalM;

  /// Dont la nature est connue : le tracé à main levée et les portions non
  /// rattachées au réseau en sont exclus.
  final double? analyzedM;
  final List<WayShare> roadKinds;
  final List<WayShare> surfaces;
  final List<WayShare> cycleInfrastructure;

  bool get hasElevation => profile.length >= 2;
  bool get hasWays => roadKinds.isNotEmpty || surfaces.isNotEmpty;
}

/// L'élévation et la nature des voies d'une route, calculées par le serveur
/// après le tracé. Chaque moitié peut manquer (service indisponible) : voir
/// [elevationError] et [waysError].
class RouteInsights {
  const RouteInsights({
    required this.computedAt,
    required this.isStale,
    required this.mobilities,
    this.elevationError,
    this.waysError,
  });

  final DateTime? computedAt;

  /// La route a changé depuis le calcul : les valeurs ne correspondent plus.
  final bool isStale;
  final String? elevationError;
  final String? waysError;
  final List<MobilityInsights> mobilities;

  bool get hasError => elevationError != null || waysError != null;

  MobilityInsights? of(MobilityType mobility) =>
      mobilities.where((m) => m.mobility == mobility).firstOrNull;
}

/// Les modalités dont le serveur calcule l'élévation et la nature des voies.
const insightsMobilities = {MobilityType.bike, MobilityType.walk};
