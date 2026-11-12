// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/geosearch/data/graphql/__generated__/geosearch_fields.data.gql.dart'
    as _i2;

class GSearchPlacesData {
  const GSearchPlacesData({
    required this.searchPlaces,
    this.G__typename = 'Query',
  });

  factory GSearchPlacesData.fromJson(Map<String, dynamic> json) {
    return GSearchPlacesData(
      searchPlaces: GSearchPlacesData_searchPlaces.fromJson(
          (json['searchPlaces'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GSearchPlacesData_searchPlaces searchPlaces;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['searchPlaces'] = this.searchPlaces.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSearchPlacesData copyWith({
    GSearchPlacesData_searchPlaces? searchPlaces,
    String? G__typename,
  }) {
    return GSearchPlacesData(
      searchPlaces: searchPlaces ?? this.searchPlaces,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchPlacesData &&
            searchPlaces == other.searchPlaces &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, searchPlaces, G__typename);
  }

  @override
  String toString() {
    return 'GSearchPlacesData(searchPlaces: $searchPlaces, G__typename: $G__typename)';
  }
}

class GSearchPlacesData_searchPlaces {
  const GSearchPlacesData_searchPlaces({
    required this.mode,
    this.category,
    required this.results,
    this.G__typename = 'SearchResponse',
  });

  factory GSearchPlacesData_searchPlaces.fromJson(Map<String, dynamic> json) {
    return GSearchPlacesData_searchPlaces(
      mode: _i1.GResultMode.fromJson((json['mode'] as String)),
      category: json['category'] == null
          ? null
          : GSearchPlacesData_searchPlaces_category.fromJson(
              (json['category'] as Map<String, dynamic>)),
      results: (json['results'] as List<dynamic>)
          .map((_$e) => _i2.GPlaceResultFieldsData.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GResultMode mode;

  final GSearchPlacesData_searchPlaces_category? category;

  final List<_i2.GPlaceResultFieldsData> results;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['mode'] = this.mode.toJson();
    final _$categoryValue = this.category;
    _$result['category'] =
        _$categoryValue == null ? null : _$categoryValue.toJson();
    _$result['results'] = this.results.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSearchPlacesData_searchPlaces copyWith({
    _i1.GResultMode? mode,
    GSearchPlacesData_searchPlaces_category? category,
    bool categoryIsSet = false,
    List<_i2.GPlaceResultFieldsData>? results,
    String? G__typename,
  }) {
    return GSearchPlacesData_searchPlaces(
      mode: mode ?? this.mode,
      category: category != null || categoryIsSet ? category : this.category,
      results: results ?? this.results,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchPlacesData_searchPlaces &&
            mode == other.mode &&
            category == other.category &&
            _gqlUtils.listEquals(results, other.results) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, mode, category, _gqlUtils.listHash(results), G__typename);
  }

  @override
  String toString() {
    return 'GSearchPlacesData_searchPlaces(mode: $mode, category: $category, results: $results, G__typename: $G__typename)';
  }
}

class GSearchPlacesData_searchPlaces_category {
  const GSearchPlacesData_searchPlaces_category({
    required this.key,
    required this.label,
    this.G__typename = 'SearchCategory',
  });

  factory GSearchPlacesData_searchPlaces_category.fromJson(
      Map<String, dynamic> json) {
    return GSearchPlacesData_searchPlaces_category(
      key: (json['key'] as String),
      label: (json['label'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String key;

  final String label;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['key'] = this.key;
    _$result['label'] = this.label;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSearchPlacesData_searchPlaces_category copyWith({
    String? key,
    String? label,
    String? G__typename,
  }) {
    return GSearchPlacesData_searchPlaces_category(
      key: key ?? this.key,
      label: label ?? this.label,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchPlacesData_searchPlaces_category &&
            key == other.key &&
            label == other.label &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, key, label, G__typename);
  }

  @override
  String toString() {
    return 'GSearchPlacesData_searchPlaces_category(key: $key, label: $label, G__typename: $G__typename)';
  }
}
