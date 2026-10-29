// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GEditRouteVars {
  const GEditRouteVars({
    required this.tripId,
    required this.input,
  });

  factory GEditRouteVars.fromJson(Map<String, dynamic> json) {
    return GEditRouteVars(
      tripId: (json['tripId'] as String),
      input:
          _i1.GEditRouteInput.fromJson((json['input'] as Map<String, dynamic>)),
    );
  }

  final String tripId;

  final _i1.GEditRouteInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GEditRouteVars copyWith({
    String? tripId,
    _i1.GEditRouteInput? input,
  }) {
    return GEditRouteVars(
      tripId: tripId ?? this.tripId,
      input: input ?? this.input,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GEditRouteVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GEditRouteVars(tripId: $tripId, input: $input)';
  }
}

class GSetTripOriginVars {
  const GSetTripOriginVars({
    required this.tripId,
    required this.origin,
  });

  factory GSetTripOriginVars.fromJson(Map<String, dynamic> json) {
    return GSetTripOriginVars(
      tripId: (json['tripId'] as String),
      origin:
          _i1.GLatLngInput.fromJson((json['origin'] as Map<String, dynamic>)),
    );
  }

  final String tripId;

  final _i1.GLatLngInput origin;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$originValue = this.origin;
    _$result['origin'] = _$originValue.toJson();
    return _$result;
  }

  GSetTripOriginVars copyWith({
    String? tripId,
    _i1.GLatLngInput? origin,
  }) {
    return GSetTripOriginVars(
      tripId: tripId ?? this.tripId,
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
    return 'GSetTripOriginVars(tripId: $tripId, origin: $origin)';
  }
}

class GDeleteRouteVars {
  const GDeleteRouteVars({required this.tripId});

  factory GDeleteRouteVars.fromJson(Map<String, dynamic> json) {
    return GDeleteRouteVars(tripId: (json['tripId'] as String));
  }

  final String tripId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    return _$result;
  }

  GDeleteRouteVars copyWith({String? tripId}) {
    return GDeleteRouteVars(tripId: tripId ?? this.tripId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteRouteVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDeleteRouteVars(tripId: $tripId)';
  }
}
