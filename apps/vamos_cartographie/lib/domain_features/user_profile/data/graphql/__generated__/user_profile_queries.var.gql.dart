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

class GGetFollowersVars {
  const GGetFollowersVars({required this.userId});

  factory GGetFollowersVars.fromJson(Map<String, dynamic> json) {
    return GGetFollowersVars(userId: (json['userId'] as String));
  }

  final String userId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$userIdValue = this.userId;
    _$result['userId'] = _$userIdValue;
    return _$result;
  }

  GGetFollowersVars copyWith({String? userId}) {
    return GGetFollowersVars(userId: userId ?? this.userId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetFollowersVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGetFollowersVars(userId: $userId)';
  }
}

class GGetFollowingVars {
  const GGetFollowingVars({required this.userId});

  factory GGetFollowingVars.fromJson(Map<String, dynamic> json) {
    return GGetFollowingVars(userId: (json['userId'] as String));
  }

  final String userId;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$userIdValue = this.userId;
    _$result['userId'] = _$userIdValue;
    return _$result;
  }

  GGetFollowingVars copyWith({String? userId}) {
    return GGetFollowingVars(userId: userId ?? this.userId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetFollowingVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGetFollowingVars(userId: $userId)';
  }
}

class GSearchUsersVars {
  const GSearchUsersVars({
    required this.prefix,
    required this.offset,
    required this.limit,
  });

  factory GSearchUsersVars.fromJson(Map<String, dynamic> json) {
    return GSearchUsersVars(
      prefix: (json['prefix'] as String),
      offset: (json['offset'] as int),
      limit: (json['limit'] as int),
    );
  }

  final String prefix;

  final int offset;

  final int limit;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$prefixValue = this.prefix;
    _$result['prefix'] = _$prefixValue;
    final _$offsetValue = this.offset;
    _$result['offset'] = _$offsetValue;
    final _$limitValue = this.limit;
    _$result['limit'] = _$limitValue;
    return _$result;
  }

  GSearchUsersVars copyWith({
    String? prefix,
    int? offset,
    int? limit,
  }) {
    return GSearchUsersVars(
      prefix: prefix ?? this.prefix,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSearchUsersVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GSearchUsersVars(prefix: $prefix, offset: $offset, limit: $limit)';
  }
}
