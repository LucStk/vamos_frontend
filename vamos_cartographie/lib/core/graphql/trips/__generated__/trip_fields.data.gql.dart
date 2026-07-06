// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/core/graphql/media/__generated__/image_fields.data.gql.dart'
    as _i1;

abstract class GTripFields {
  String get id;
  String get title;
  String? get date;
  String get description;
  List<_i1.GImageFields> get images;
  String get G__typename;
}

class GTripFieldsData implements GTripFields {
  const GTripFieldsData({
    required this.id,
    required this.title,
    this.date,
    required this.description,
    required this.images,
    this.G__typename = 'TripType',
  });

  factory GTripFieldsData.fromJson(Map<String, dynamic> json) {
    return GTripFieldsData(
      id: (json['id'] as String),
      title: (json['title'] as String),
      date: json['date'] == null ? null : (json['date'] as String),
      description: (json['description'] as String),
      images: (json['images'] as List<dynamic>)
          .map((_$e) =>
              _i1.GImageFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String title;

  final String? date;

  final String description;

  final List<_i1.GImageFieldsData> images;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['title'] = this.title;
    final _$dateValue = this.date;
    _$result['date'] = _$dateValue == null ? null : _$dateValue;
    _$result['description'] = this.description;
    _$result['images'] = this.images.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GTripFieldsData copyWith({
    String? id,
    String? title,
    String? date,
    bool dateIsSet = false,
    String? description,
    List<_i1.GImageFieldsData>? images,
    String? G__typename,
  }) {
    return GTripFieldsData(
      id: id ?? this.id,
      title: title ?? this.title,
      date: dateIsSet ? date : this.date,
      description: description ?? this.description,
      images: images ?? this.images,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTripFieldsData &&
            id == other.id &&
            title == other.title &&
            date == other.date &&
            description == other.description &&
            _gqlUtils.listEquals(images, other.images) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, title, date, description,
        _gqlUtils.listHash(images), G__typename);
  }

  @override
  String toString() {
    return 'GTripFieldsData(id: $id, title: $title, date: $date, description: $description, images: $images, G__typename: $G__typename)';
  }
}
