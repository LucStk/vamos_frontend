// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_fields.data.gql.dart'
    as _i1;

class GGetMeData {
  const GGetMeData({
    required this.me,
    this.G__typename = 'Query',
  });

  factory GGetMeData.fromJson(Map<String, dynamic> json) {
    return GGetMeData(
      me: GGetMeData_me.fromJson((json['me'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GGetMeData_me me;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['me'] = this.me.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetMeData copyWith({
    GGetMeData_me? me,
    String? G__typename,
  }) {
    return GGetMeData(
      me: me ?? this.me,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetMeData &&
            me == other.me &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, me, G__typename);
  }

  @override
  String toString() {
    return 'GGetMeData(me: $me, G__typename: $G__typename)';
  }
}

class GGetMeData_me {
  const GGetMeData_me({
    required this.id,
    this.profile,
    this.G__typename = 'GetMePayload',
  });

  factory GGetMeData_me.fromJson(Map<String, dynamic> json) {
    return GGetMeData_me(
      id: (json['id'] as String),
      profile: json['profile'] == null
          ? null
          : _i1.GUserProfileDetailsData.fromJson(
              (json['profile'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final _i1.GUserProfileDetailsData? profile;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    final _$profileValue = this.profile;
    _$result['profile'] =
        _$profileValue == null ? null : _$profileValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetMeData_me copyWith({
    String? id,
    _i1.GUserProfileDetailsData? profile,
    bool profileIsSet = false,
    String? G__typename,
  }) {
    return GGetMeData_me(
      id: id ?? this.id,
      profile: profile != null || profileIsSet ? profile : this.profile,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetMeData_me &&
            id == other.id &&
            profile == other.profile &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, profile, G__typename);
  }

  @override
  String toString() {
    return 'GGetMeData_me(id: $id, profile: $profile, G__typename: $G__typename)';
  }
}

class GGetUserData {
  const GGetUserData({
    required this.user,
    this.G__typename = 'Query',
  });

  factory GGetUserData.fromJson(Map<String, dynamic> json) {
    return GGetUserData(
      user: _i1.GUserProfileDetailsData.fromJson(
          (json['user'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GUserProfileDetailsData user;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['user'] = this.user.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetUserData copyWith({
    _i1.GUserProfileDetailsData? user,
    String? G__typename,
  }) {
    return GGetUserData(
      user: user ?? this.user,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetUserData &&
            user == other.user &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, user, G__typename);
  }

  @override
  String toString() {
    return 'GGetUserData(user: $user, G__typename: $G__typename)';
  }
}

class GGetFollowersData {
  const GGetFollowersData({
    required this.followers,
    this.G__typename = 'Query',
  });

  factory GGetFollowersData.fromJson(Map<String, dynamic> json) {
    return GGetFollowersData(
      followers: (json['followers'] as List<dynamic>)
          .map((_$e) => _i1.GUserProfileDetailsData.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GUserProfileDetailsData> followers;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['followers'] = this.followers.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetFollowersData copyWith({
    List<_i1.GUserProfileDetailsData>? followers,
    String? G__typename,
  }) {
    return GGetFollowersData(
      followers: followers ?? this.followers,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetFollowersData &&
            _gqlUtils.listEquals(followers, other.followers) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(followers), G__typename);
  }

  @override
  String toString() {
    return 'GGetFollowersData(followers: $followers, G__typename: $G__typename)';
  }
}

class GGetFollowingData {
  const GGetFollowingData({
    required this.following,
    this.G__typename = 'Query',
  });

  factory GGetFollowingData.fromJson(Map<String, dynamic> json) {
    return GGetFollowingData(
      following: (json['following'] as List<dynamic>)
          .map((_$e) => _i1.GUserProfileDetailsData.fromJson(
              (_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GUserProfileDetailsData> following;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['following'] = this.following.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetFollowingData copyWith({
    List<_i1.GUserProfileDetailsData>? following,
    String? G__typename,
  }) {
    return GGetFollowingData(
      following: following ?? this.following,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetFollowingData &&
            _gqlUtils.listEquals(following, other.following) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.listHash(following), G__typename);
  }

  @override
  String toString() {
    return 'GGetFollowingData(following: $following, G__typename: $G__typename)';
  }
}
