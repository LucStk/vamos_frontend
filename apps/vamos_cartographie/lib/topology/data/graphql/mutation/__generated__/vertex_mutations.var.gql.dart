// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GCreateVertexVars {
  const GCreateVertexVars({
    required this.tripId,
    required this.latLng,
  });

  factory GCreateVertexVars.fromJson(Map<String, dynamic> json) {
    return GCreateVertexVars(
      tripId: (json['tripId'] as String),
      latLng:
          _i1.GLatLngInput.fromJson((json['latLng'] as Map<String, dynamic>)),
    );
  }

  final String tripId;

  final _i1.GLatLngInput latLng;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$latLngValue = this.latLng;
    _$result['latLng'] = _$latLngValue.toJson();
    return _$result;
  }

  GCreateVertexVars copyWith({
    String? tripId,
    _i1.GLatLngInput? latLng,
  }) {
    return GCreateVertexVars(
      tripId: tripId ?? this.tripId,
      latLng: latLng ?? this.latLng,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateVertexVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCreateVertexVars(tripId: $tripId, latLng: $latLng)';
  }
}

class GMoveVertexVars {
  const GMoveVertexVars({
    required this.id,
    required this.latLng,
  });

  factory GMoveVertexVars.fromJson(Map<String, dynamic> json) {
    return GMoveVertexVars(
      id: (json['id'] as String),
      latLng:
          _i1.GLatLngInput.fromJson((json['latLng'] as Map<String, dynamic>)),
    );
  }

  final String id;

  final _i1.GLatLngInput latLng;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    final _$latLngValue = this.latLng;
    _$result['latLng'] = _$latLngValue.toJson();
    return _$result;
  }

  GMoveVertexVars copyWith({
    String? id,
    _i1.GLatLngInput? latLng,
  }) {
    return GMoveVertexVars(
      id: id ?? this.id,
      latLng: latLng ?? this.latLng,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GMoveVertexVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GMoveVertexVars(id: $id, latLng: $latLng)';
  }
}

class GDeleteVertexVars {
  const GDeleteVertexVars({required this.vertexId});

  factory GDeleteVertexVars.fromJson(Map<String, dynamic> json) {
    return GDeleteVertexVars(vertexId: (json['vertexId'] as String));
  }

  final String vertexId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$vertexIdValue = this.vertexId;
    _$result['vertexId'] = _$vertexIdValue;
    return _$result;
  }

  GDeleteVertexVars copyWith({String? vertexId}) {
    return GDeleteVertexVars(vertexId: vertexId ?? this.vertexId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteVertexVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDeleteVertexVars(vertexId: $vertexId)';
  }
}
