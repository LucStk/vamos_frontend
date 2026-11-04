// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GGetUserVars {
  const GGetUserVars({required this.userId});

  factory GGetUserVars.fromJson(Map<String, dynamic> json) {
    return GGetUserVars(userId: (json['userId'] as String));
  }

  final String userId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$userIdValue = this.userId;
    _$result['userId'] = _$userIdValue;
    return _$result;
  }

  GGetUserVars copyWith({String? userId}) {
    return GGetUserVars(userId: userId ?? this.userId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetUserVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGetUserVars(userId: $userId)';
  }
}
