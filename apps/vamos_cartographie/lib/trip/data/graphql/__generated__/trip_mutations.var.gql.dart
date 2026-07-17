// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
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
      id: (json['id'] as String),
    );
  }

  final _i1.GTripUpdateInput trip;

  final String id;

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
    String? id,
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

class GAttachFileToTripVars {
  const GAttachFileToTripVars({required this.input});

  factory GAttachFileToTripVars.fromJson(Map<String, dynamic> json) {
    return GAttachFileToTripVars(
        input: _i1.GAttachFileTripInput.fromJson(
            (json['input'] as Map<String, dynamic>)));
  }

  final _i1.GAttachFileTripInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GAttachFileToTripVars copyWith({_i1.GAttachFileTripInput? input}) {
    return GAttachFileToTripVars(input: input ?? this.input);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachFileToTripVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GAttachFileToTripVars(input: $input)';
  }
}
