// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart'
    as _i1;

abstract class GUserProfileFields {
  String get userId;
  String get profileName;
  _i1.GStoredFile? get profilePicture;
  String get bio;
  String get G__typename;
}

class GUserProfileFieldsData implements GUserProfileFields {
  const GUserProfileFieldsData({
    required this.userId,
    required this.profileName,
    this.profilePicture,
    required this.bio,
    this.G__typename = 'UserProfileType',
  });

  factory GUserProfileFieldsData.fromJson(Map<String, dynamic> json) {
    return GUserProfileFieldsData(
      userId: (json['userId'] as String),
      profileName: (json['profileName'] as String),
      profilePicture: json['profilePicture'] == null
          ? null
          : _i1.GStoredFileData.fromJson(
              (json['profilePicture'] as Map<String, dynamic>)),
      bio: (json['bio'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String userId;

  final String profileName;

  final _i1.GStoredFileData? profilePicture;

  final String bio;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['userId'] = this.userId;
    _$result['profileName'] = this.profileName;
    final _$profilePictureValue = this.profilePicture;
    _$result['profilePicture'] =
        _$profilePictureValue == null ? null : _$profilePictureValue.toJson();
    _$result['bio'] = this.bio;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUserProfileFieldsData copyWith({
    String? userId,
    String? profileName,
    _i1.GStoredFileData? profilePicture,
    bool profilePictureIsSet = false,
    String? bio,
    String? G__typename,
  }) {
    return GUserProfileFieldsData(
      userId: userId ?? this.userId,
      profileName: profileName ?? this.profileName,
      profilePicture: profilePicture != null || profilePictureIsSet
          ? profilePicture
          : this.profilePicture,
      bio: bio ?? this.bio,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUserProfileFieldsData &&
            userId == other.userId &&
            profileName == other.profileName &&
            profilePicture == other.profilePicture &&
            bio == other.bio &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, userId, profileName, profilePicture, bio, G__typename);
  }

  @override
  String toString() {
    return 'GUserProfileFieldsData(userId: $userId, profileName: $profileName, profilePicture: $profilePicture, bio: $bio, G__typename: $G__typename)';
  }
}
