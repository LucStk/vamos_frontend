// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GUpdateTripVars {
  const GUpdateTripVars({
    required this.id,
    required this.input,
  });

  factory GUpdateTripVars.fromJson(Map<String, dynamic> json) {
    return GUpdateTripVars(
      id: (json['id'] as String),
      input: _i1.GTripUpdateInput.fromJson(
          (json['input'] as Map<String, dynamic>)),
    );
  }

  final String id;

  final _i1.GTripUpdateInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GUpdateTripVars copyWith({
    String? id,
    _i1.GTripUpdateInput? input,
  }) {
    return GUpdateTripVars(
      id: id ?? this.id,
      input: input ?? this.input,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateTripVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GUpdateTripVars(id: $id, input: $input)';
  }
}

class GCreateBlankTripVars {
  const GCreateBlankTripVars({this.origin = const Value.absent()});

  factory GCreateBlankTripVars.fromJson(Map<String, dynamic> json) {
    return GCreateBlankTripVars(
        origin: json.containsKey('origin')
            ? Value.present(json['origin'] == null
                ? null
                : _i1.GLatLngInput.fromJson(
                    (json['origin'] as Map<String, dynamic>)))
            : Value.absent());
  }

  final Value<_i1.GLatLngInput> origin;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$originValue = this.origin;
    if (_$originValue.isPresent) {
      final _$originRequired = _$originValue.requireValue;
      _$result['origin'] =
          _$originRequired == null ? null : _$originRequired.toJson();
    }
    return _$result;
  }

  GCreateBlankTripVars copyWith({Value<_i1.GLatLngInput>? origin}) {
    return GCreateBlankTripVars(origin: origin ?? this.origin);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateBlankTripVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCreateBlankTripVars(origin: $origin)';
  }
}

class GDeleteTripVars {
  const GDeleteTripVars({required this.id});

  factory GDeleteTripVars.fromJson(Map<String, dynamic> json) {
    return GDeleteTripVars(id: (json['id'] as String));
  }

  final String id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GDeleteTripVars copyWith({String? id}) {
    return GDeleteTripVars(id: id ?? this.id);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteTripVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDeleteTripVars(id: $id)';
  }
}

class GSetTripOriginVars {
  const GSetTripOriginVars({
    required this.id,
    required this.origin,
  });

  factory GSetTripOriginVars.fromJson(Map<String, dynamic> json) {
    return GSetTripOriginVars(
      id: (json['id'] as String),
      origin:
          _i1.GLatLngInput.fromJson((json['origin'] as Map<String, dynamic>)),
    );
  }

  final String id;

  final _i1.GLatLngInput origin;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    final _$originValue = this.origin;
    _$result['origin'] = _$originValue.toJson();
    return _$result;
  }

  GSetTripOriginVars copyWith({
    String? id,
    _i1.GLatLngInput? origin,
  }) {
    return GSetTripOriginVars(
      id: id ?? this.id,
      origin: origin ?? this.origin,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetTripOriginVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GSetTripOriginVars(id: $id, origin: $origin)';
  }
}
