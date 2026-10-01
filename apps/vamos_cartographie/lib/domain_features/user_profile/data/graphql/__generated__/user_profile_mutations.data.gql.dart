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
      createProfile: _i1.GCreateProfilePayloadData.fromJson(
          (json['createProfile'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GCreateProfilePayloadData createProfile;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createProfile'] = this.createProfile.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateProfileData copyWith({
    _i1.GCreateProfilePayloadData? createProfile,
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
      updateProfile: _i1.GUserProfileFieldsData.fromJson(
          (json['updateProfile'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GUserProfileFieldsData updateProfile;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['updateProfile'] = this.updateProfile.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUpdateProfileData copyWith({
    _i1.GUserProfileFieldsData? updateProfile,
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
