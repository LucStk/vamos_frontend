import 'package:latlong2/latlong.dart';

import 'place_result.dart';

enum SearchMode { auto, place, category }

abstract interface class GeosearchRepository {
  /// Cherche un lieu (nom/adresse) ou une catégorie ("camping") autour de
  /// [lat]/[lon]. Lève une GeosearchFailure en cas d'erreur.
  Future<SearchResponse> search(
    String query, {
    LatLng? origin,
    int limit = 8,
    double? radiusKm,
    SearchMode mode = SearchMode.auto,
  });
}
