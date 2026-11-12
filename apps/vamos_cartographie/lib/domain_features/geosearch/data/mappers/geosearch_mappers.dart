import 'package:vamos_cartographie/core/graphql/graphql.dart'
    show GResultMode, GSearchMode;
import 'package:vamos_cartographie/core/mappers/geometry_mappers/bounds_mapper.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/domain_features/geosearch/data/graphql/__generated__/geosearch_fields.data.gql.dart';
import 'package:vamos_cartographie/domain_features/geosearch/data/graphql/__generated__/geosearch_queries.data.gql.dart';
import 'package:vamos_cartographie/domain_features/geosearch/domain/geosearch_repository.dart';
import 'package:vamos_cartographie/domain_features/geosearch/domain/place_result.dart';

GSearchMode searchModeToGql(SearchMode mode) => switch (mode) {
  SearchMode.auto => GSearchMode.AUTO,
  SearchMode.place => GSearchMode.PLACE,
  SearchMode.category => GSearchMode.CATEGORY,
};

PlaceResult placeFromFields(GPlaceResultFieldsData f) => PlaceResult(
  id: f.id,
  name: f.name,
  subtitle: f.subtitle,
  position: f.position.toLatLng(),
  category: f.category,
  distanceM: f.distanceM,
  bbox: f.bounds?.toMapBounds(),
);

SearchResponse searchResponseFromData(GSearchPlacesData data) {
  final response = data.searchPlaces;
  final category = response.category;

  return SearchResponse(
    isCategory: response.mode == GResultMode.CATEGORY,
    category: category == null
        ? null
        : SearchCategory(key: category.key, label: category.label),
    results: response.results.map(placeFromFields).toList(),
  );
}
