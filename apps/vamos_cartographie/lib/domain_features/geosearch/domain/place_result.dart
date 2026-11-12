import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';

/// Modèles de domaine de la recherche de lieux.
///
/// La position est exposée en lat/lon bruts : si vous avez un type géo commun
/// (LatLng, GeoPoint...), faites la conversion dans mappers/geosearch_mappers.dart.
//
class SearchCategory {
  const SearchCategory({required this.key, required this.label});

  final String key;
  final String label;
}

class PlaceResult {
  const PlaceResult({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.position,
    required this.category,
    this.distanceM,
    this.bbox,
  });

  final String id;
  final String name;
  final String subtitle;
  final LatLng position;

  /// Tag OSM, par exemple "tourism:camp_site".
  final String category;

  /// Présent uniquement pour une recherche par catégorie.
  final int? distanceM;

  /// [minLon, minLat, maxLon, maxLat], pour cadrer la carte (villes, zones).
  final MapLatLngBounds? bbox;
}

class SearchResponse {
  const SearchResponse({
    required this.isCategory,
    required this.results,
    this.category,
  });

  static const empty = SearchResponse(isCategory: false, results: []);

  /// true si le serveur a interprété la saisie comme une catégorie ("camping").
  final bool isCategory;
  final SearchCategory? category;
  final List<PlaceResult> results;
}
