// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GExtendRouteVars {
  const GExtendRouteVars({
    required this.tripId,
    required this.input,
  });

  factory GExtendRouteVars.fromJson(Map<String, dynamic> json) {
    return GExtendRouteVars(
      tripId: (json['tripId'] as String),
      input: _i1.GExtendRouteInput.fromJson(
          (json['input'] as Map<String, dynamic>)),
    );
  }

  final String tripId;

  final _i1.GExtendRouteInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GExtendRouteVars copyWith({
    String? tripId,
    _i1.GExtendRouteInput? input,
  }) {
    return GExtendRouteVars(
      tripId: tripId ?? this.tripId,
      input: input ?? this.input,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GExtendRouteVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GExtendRouteVars(tripId: $tripId, input: $input)';
  }
}

class GPrependRouteVars {
  const GPrependRouteVars({
    required this.tripId,
    required this.input,
  });

  factory GPrependRouteVars.fromJson(Map<String, dynamic> json) {
    return GPrependRouteVars(
      tripId: (json['tripId'] as String),
      input: _i1.GExtendRouteInput.fromJson(
          (json['input'] as Map<String, dynamic>)),
    );
  }

  final String tripId;

  final _i1.GExtendRouteInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GPrependRouteVars copyWith({
    String? tripId,
    _i1.GExtendRouteInput? input,
  }) {
    return GPrependRouteVars(
      tripId: tripId ?? this.tripId,
      input: input ?? this.input,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GPrependRouteVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GPrependRouteVars(tripId: $tripId, input: $input)';
  }
}

class GRedrawRoutePortionVars {
  const GRedrawRoutePortionVars({
    required this.tripId,
    required this.input,
  });

  factory GRedrawRoutePortionVars.fromJson(Map<String, dynamic> json) {
    return GRedrawRoutePortionVars(
      tripId: (json['tripId'] as String),
      input: _i1.GRedrawRouteInput.fromJson(
          (json['input'] as Map<String, dynamic>)),
    );
  }

  final String tripId;

  final _i1.GRedrawRouteInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GRedrawRoutePortionVars copyWith({
    String? tripId,
    _i1.GRedrawRouteInput? input,
  }) {
    return GRedrawRoutePortionVars(
      tripId: tripId ?? this.tripId,
      input: input ?? this.input,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRedrawRoutePortionVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GRedrawRoutePortionVars(tripId: $tripId, input: $input)';
  }
}
