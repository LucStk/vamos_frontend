// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/topology/data/graphql/fields/__generated__/geo_fields.data.gql.dart'
    as _i3;
import 'package:vamos_cartographie/topology/data/graphql/fields/__generated__/vertex_fields.data.gql.dart'
    as _i2;

abstract class GSegmentFields {
  String get id;
  _i1.GMobilityType get mobilityType;
  _i2.GVertexFields get startVertex;
  _i2.GVertexFields get endVertex;
  List<_i3.GLatLngFields> get geometry;
  String get G__typename;
}

class GSegmentFieldsData implements GSegmentFields {
  const GSegmentFieldsData({
    required this.id,
    required this.mobilityType,
    required this.startVertex,
    required this.endVertex,
    required this.geometry,
    this.G__typename = 'SegmentType',
  });

  factory GSegmentFieldsData.fromJson(Map<String, dynamic> json) {
    return GSegmentFieldsData(
      id: (json['id'] as String),
      mobilityType:
          _i1.GMobilityType.fromJson((json['mobilityType'] as String)),
      startVertex: _i2.GVertexFieldsData.fromJson(
          (json['startVertex'] as Map<String, dynamic>)),
      endVertex: _i2.GVertexFieldsData.fromJson(
          (json['endVertex'] as Map<String, dynamic>)),
      geometry: (json['geometry'] as List<dynamic>)
          .map((_$e) =>
              _i3.GLatLngFieldsData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final _i1.GMobilityType mobilityType;

  final _i2.GVertexFieldsData startVertex;

  final _i2.GVertexFieldsData endVertex;

  final List<_i3.GLatLngFieldsData> geometry;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['mobilityType'] = this.mobilityType.toJson();
    _$result['startVertex'] = this.startVertex.toJson();
    _$result['endVertex'] = this.endVertex.toJson();
    _$result['geometry'] = this.geometry.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSegmentFieldsData copyWith({
    String? id,
    _i1.GMobilityType? mobilityType,
    _i2.GVertexFieldsData? startVertex,
    _i2.GVertexFieldsData? endVertex,
    List<_i3.GLatLngFieldsData>? geometry,
    String? G__typename,
  }) {
    return GSegmentFieldsData(
      id: id ?? this.id,
      mobilityType: mobilityType ?? this.mobilityType,
      startVertex: startVertex ?? this.startVertex,
      endVertex: endVertex ?? this.endVertex,
      geometry: geometry ?? this.geometry,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentFieldsData &&
            id == other.id &&
            mobilityType == other.mobilityType &&
            startVertex == other.startVertex &&
            endVertex == other.endVertex &&
            _gqlUtils.listEquals(geometry, other.geometry) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, mobilityType, startVertex, endVertex,
        _gqlUtils.listHash(geometry), G__typename);
  }

  @override
  String toString() {
    return 'GSegmentFieldsData(id: $id, mobilityType: $mobilityType, startVertex: $startVertex, endVertex: $endVertex, geometry: $geometry, G__typename: $G__typename)';
  }
}

abstract class GSegmentSplicePayloadFragment {
  List<String> get deletedSegmentIds;
  GSegmentFields get segment;
  String get G__typename;
}

class GSegmentSplicePayloadFragmentData
    implements GSegmentSplicePayloadFragment {
  const GSegmentSplicePayloadFragmentData({
    required this.deletedSegmentIds,
    required this.segment,
    this.G__typename = 'SegmentSplicePayload',
  });

  factory GSegmentSplicePayloadFragmentData.fromJson(
      Map<String, dynamic> json) {
    return GSegmentSplicePayloadFragmentData(
      deletedSegmentIds:
          List<String>.from((json['deletedSegmentIds'] as List<dynamic>)),
      segment: GSegmentFieldsData.fromJson(
          (json['segment'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<String> deletedSegmentIds;

  final GSegmentFieldsData segment;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['deletedSegmentIds'] =
        this.deletedSegmentIds.map((_$e) => _$e).toList();
    _$result['segment'] = this.segment.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSegmentSplicePayloadFragmentData copyWith({
    List<String>? deletedSegmentIds,
    GSegmentFieldsData? segment,
    String? G__typename,
  }) {
    return GSegmentSplicePayloadFragmentData(
      deletedSegmentIds: deletedSegmentIds ?? this.deletedSegmentIds,
      segment: segment ?? this.segment,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentSplicePayloadFragmentData &&
            _gqlUtils.listEquals(deletedSegmentIds, other.deletedSegmentIds) &&
            segment == other.segment &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(deletedSegmentIds),
        segment, G__typename);
  }

  @override
  String toString() {
    return 'GSegmentSplicePayloadFragmentData(deletedSegmentIds: $deletedSegmentIds, segment: $segment, G__typename: $G__typename)';
  }
}
