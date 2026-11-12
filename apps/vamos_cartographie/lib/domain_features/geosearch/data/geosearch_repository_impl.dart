import 'dart:async';

import 'package:vamos_cartographie/domain_features/geosearch/data/geosearch_failures.dart';
import 'package:vamos_cartographie/domain_features/geosearch/data/geosearch_remote_datasource.dart';
import 'package:vamos_cartographie/domain_features/geosearch/data/mappers/geosearch_exceptions_mappers.dart';
import 'package:vamos_cartographie/domain_features/geosearch/data/mappers/geosearch_mappers.dart';
import 'package:vamos_cartographie/domain_features/geosearch/domain/geosearch_repository.dart';
import 'package:vamos_cartographie/domain_features/geosearch/domain/place_result.dart';

class GeosearchRepositoryImpl implements GeosearchRepository {
  const GeosearchRepositoryImpl(this._datasource);

  final GeosearchRemoteDatasource _datasource;

  // Si vos repositories renvoient un Either/Result plutôt que de lever des
  // failures, adaptez uniquement cette méthode.
  @override
  Future<SearchResponse> search(
    String query, {
    double? lat,
    double? lon,
    int limit = 8,
    double? radiusKm,
    SearchMode mode = SearchMode.auto,
  }) async {
    try {
      final data = await _datasource.searchPlaces(
        query: query,
        lat: lat,
        lon: lon,
        limit: limit,
        radiusKm: radiusKm,
        mode: searchModeToGql(mode),
      );
      return searchResponseFromData(data);
    } on GeosearchRequestException catch (e) {
      throw e.toFailure();
    } on TimeoutException {
      throw const SearchUnavailableFailure();
    }
  }
}
