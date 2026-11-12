// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_fields.data.gql.dart'
    as _i1;

class GCreateProfileData {
  const GCreateProfileData({
    required this.createProfile,
    this.G__typename = 'Mutation',
  });

  factory GCreateProfileData.fromJson(Map<String, dynamic> json) {
    return GCreateProfileData(
      createProfile: _i1.GCreateProfileResultData.fromJson(
          (json['createProfile'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GCreateProfileResultData createProfile;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createProfile'] = this.createProfile.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateProfileData copyWith({
    _i1.GCreateProfileResultData? createProfile,
    String? G__typename,
  }) {
    return GCreateProfileData(
      createProfile: createProfile ?? this.createProfile,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateProfileData &&
            createProfile == other.createProfile &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createProfile, G__typename);
  }

  @override
  String toString() {
    return 'GCreateProfileData(createProfile: $createProfile, G__typename: $G__typename)';
  }
}

class GUpdateProfileData {
  const GUpdateProfileData({
    required this.updateProfile,
    this.G__typename = 'Mutation',
  });

  factory GUpdateProfileData.fromJson(Map<String, dynamic> json) {
    return GUpdateProfileData(
      updateProfile: _i1.GUserProfileDetailsData.fromJson(
          (json['updateProfile'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GUserProfileDetailsData updateProfile;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['updateProfile'] = this.updateProfile.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUpdateProfileData copyWith({
    _i1.GUserProfileDetailsData? updateProfile,
    String? G__typename,
  }) {
    return GUpdateProfileData(
      updateProfile: updateProfile ?? this.updateProfile,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateProfileData &&
            updateProfile == other.updateProfile &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, updateProfile, G__typename);
  }

  @override
  String toString() {
    return 'GUpdateProfileData(updateProfile: $updateProfile, G__typename: $G__typename)';
  }
}

class GFollowUserData {
  const GFollowUserData({
    required this.followUser,
    this.G__typename = 'Mutation',
  });

  factory GFollowUserData.fromJson(Map<String, dynamic> json) {
    return GFollowUserData(
      followUser: _i1.GUserProfileDetailsData.fromJson(
          (json['followUser'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GUserProfileDetailsData followUser;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['followUser'] = this.followUser.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GFollowUserData copyWith({
    _i1.GUserProfileDetailsData? followUser,
    String? G__typename,
  }) {
    return GFollowUserData(
      followUser: followUser ?? this.followUser,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFollowUserData &&
            followUser == other.followUser &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, followUser, G__typename);
  }

  @override
  String toString() {
    return 'GFollowUserData(followUser: $followUser, G__typename: $G__typename)';
  }
}

class GUnFollowUserData {
  const GUnFollowUserData({
    required this.unfollowUser,
    this.G__typename = 'Mutation',
  });

  factory GUnFollowUserData.fromJson(Map<String, dynamic> json) {
    return GUnFollowUserData(
      unfollowUser: _i1.GUserProfileDetailsData.fromJson(
          (json['unfollowUser'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GUserProfileDetailsData unfollowUser;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['unfollowUser'] = this.unfollowUser.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUnFollowUserData copyWith({
    _i1.GUserProfileDetailsData? unfollowUser,
    String? G__typename,
  }) {
    return GUnFollowUserData(
      unfollowUser: unfollowUser ?? this.unfollowUser,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUnFollowUserData &&
            unfollowUser == other.unfollowUser &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, unfollowUser, G__typename);
  }

  @override
  String toString() {
    return 'GUnFollowUserData(unfollowUser: $unfollowUser, G__typename: $G__typename)';
  }
}
