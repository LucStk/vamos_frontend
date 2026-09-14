// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart'
    as _i1;

abstract class GUserProfileFields {
  String get userId;
  String get profileName;
  _i1.GStoredFile? get profilPicture;
  String get bio;
  String get G__typename;
}

class GUserProfileFieldsData implements GUserProfileFields {
  const GUserProfileFieldsData({
    required this.userId,
    required this.profileName,
    this.profilPicture,
    required this.bio,
    this.G__typename = 'UserProfileType',
  });

  factory GUserProfileFieldsData.fromJson(Map<String, dynamic> json) {
    return GUserProfileFieldsData(
      userId: (json['userId'] as String),
      profileName: (json['profileName'] as String),
      profilPicture: json['profilPicture'] == null
          ? null
          : _i1.GStoredFileData.fromJson(
              (json['profilPicture'] as Map<String, dynamic>)),
      bio: (json['bio'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String userId;

  final String profileName;

  final _i1.GStoredFileData? profilPicture;

  final String bio;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['userId'] = this.userId;
    _$result['profileName'] = this.profileName;
    final _$profilPictureValue = this.profilPicture;
    _$result['profilPicture'] =
        _$profilPictureValue == null ? null : _$profilPictureValue.toJson();
    _$result['bio'] = this.bio;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUserProfileFieldsData copyWith({
    String? userId,
    String? profileName,
    _i1.GStoredFileData? profilPicture,
    bool profilPictureIsSet = false,
    String? bio,
    String? G__typename,
  }) {
    return GUserProfileFieldsData(
      userId: userId ?? this.userId,
      profileName: profileName ?? this.profileName,
      profilPicture: profilPicture != null || profilPictureIsSet
          ? profilPicture
          : this.profilPicture,
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
            profilPicture == other.profilPicture &&
            bio == other.bio &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, userId, profileName, profilPicture, bio, G__typename);
  }

  @override
  String toString() {
    return 'GUserProfileFieldsData(userId: $userId, profileName: $profileName, profilPicture: $profilPicture, bio: $bio, G__typename: $G__typename)';
  }
}
