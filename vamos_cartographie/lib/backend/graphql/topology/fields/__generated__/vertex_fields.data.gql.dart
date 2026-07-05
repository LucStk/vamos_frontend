// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/backend/graphql/shared/__generated__/geo_fields.data.gql.dart'
    as _i1;

abstract class GVertexFields {
  String get id;
  _i1.GLatLngFields get latLng;
  String get G__typename;
}

class GVertexFieldsData implements GVertexFields {
  const GVertexFieldsData({
    required this.id,
    required this.latLng,
    this.G__typename = 'VertexType',
  });

  factory GVertexFieldsData.fromJson(Map<String, dynamic> json) {
    return GVertexFieldsData(
      id: (json['id'] as String),
      latLng: _i1.GLatLngFieldsData.fromJson(
          (json['latLng'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final _i1.GLatLngFieldsData latLng;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['latLng'] = this.latLng.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GVertexFieldsData copyWith({
    String? id,
    _i1.GLatLngFieldsData? latLng,
    String? G__typename,
  }) {
    return GVertexFieldsData(
      id: id ?? this.id,
      latLng: latLng ?? this.latLng,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GVertexFieldsData &&
            id == other.id &&
            latLng == other.latLng &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, latLng, G__typename);
  }

  @override
  String toString() {
    return 'GVertexFieldsData(id: $id, latLng: $latLng, G__typename: $G__typename)';
  }
}
