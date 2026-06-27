// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/backend/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/backend/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GUpdateTripVars {
  const GUpdateTripVars({
    required this.trip,
    required this.id,
  });

  factory GUpdateTripVars.fromJson(Map<String, dynamic> json) {
    return GUpdateTripVars(
      trip:
          _i1.GTripUpdateInput.fromJson((json['trip'] as Map<String, dynamic>)),
      id: (json['id'] as int),
    );
  }

  final _i1.GTripUpdateInput trip;

  final int id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripValue = this.trip;
    _$result['trip'] = _$tripValue.toJson();
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GUpdateTripVars copyWith({
    _i1.GTripUpdateInput? trip,
    int? id,
  }) {
    return GUpdateTripVars(
      trip: trip ?? this.trip,
      id: id ?? this.id,
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
    return 'GUpdateTripVars(trip: $trip, id: $id)';
  }
}

class GDeleteTripVars {
  const GDeleteTripVars({required this.id});

  factory GDeleteTripVars.fromJson(Map<String, dynamic> json) {
    return GDeleteTripVars(id: (json['id'] as int));
  }

  final int id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GDeleteTripVars copyWith({int? id}) {
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
