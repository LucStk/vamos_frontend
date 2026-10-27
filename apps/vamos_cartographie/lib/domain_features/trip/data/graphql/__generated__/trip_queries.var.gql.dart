// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GGetTripBundleVars {
  const GGetTripBundleVars({required this.id});

  factory GGetTripBundleVars.fromJson(Map<String, dynamic> json) {
    return GGetTripBundleVars(id: (json['id'] as String));
  }

  final String id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GGetTripBundleVars copyWith({String? id}) {
    return GGetTripBundleVars(id: id ?? this.id);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripBundleVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGetTripBundleVars(id: $id)';
  }
}

class GGetTripSummaryVars {
  const GGetTripSummaryVars({required this.id});

  factory GGetTripSummaryVars.fromJson(Map<String, dynamic> json) {
    return GGetTripSummaryVars(id: (json['id'] as String));
  }

  final String id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GGetTripSummaryVars copyWith({String? id}) {
    return GGetTripSummaryVars(id: id ?? this.id);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripSummaryVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGetTripSummaryVars(id: $id)';
  }
}

class GGetUserTripsSummaryVars {
  const GGetUserTripsSummaryVars({required this.id});

  factory GGetUserTripsSummaryVars.fromJson(Map<String, dynamic> json) {
    return GGetUserTripsSummaryVars(id: (json['id'] as String));
  }

  final String id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GGetUserTripsSummaryVars copyWith({String? id}) {
    return GGetUserTripsSummaryVars(id: id ?? this.id);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetUserTripsSummaryVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGetUserTripsSummaryVars(id: $id)';
  }
}
