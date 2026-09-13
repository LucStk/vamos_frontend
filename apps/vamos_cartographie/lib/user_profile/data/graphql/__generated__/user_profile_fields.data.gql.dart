// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart'
    as _i1;

abstract class GUserProfileFields {
  String get profileName;
  _i1.GStoredFile? get profilPicture;
  String get bio;
  String get country;
  String get G__typename;
}

class GUserProfileFieldsData implements GUserProfileFields {
  const GUserProfileFieldsData({
    required this.profileName,
    this.profilPicture,
    required this.bio,
    required this.country,
    this.G__typename = 'UserProfileType',
  });

  factory GUserProfileFieldsData.fromJson(Map<String, dynamic> json) {
    return GUserProfileFieldsData(
      profileName: (json['profileName'] as String),
      profilPicture: json['profilPicture'] == null
          ? null
          : _i1.GStoredFileData.fromJson(
              (json['profilPicture'] as Map<String, dynamic>)),
      bio: (json['bio'] as String),
      country: (json['country'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String profileName;

  final _i1.GStoredFileData? profilPicture;

  final String bio;

  final String country;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['profileName'] = this.profileName;
    final _$profilPictureValue = this.profilPicture;
    _$result['profilPicture'] =
        _$profilPictureValue == null ? null : _$profilPictureValue.toJson();
    _$result['bio'] = this.bio;
    _$result['country'] = this.country;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUserProfileFieldsData copyWith({
    String? profileName,
    _i1.GStoredFileData? profilPicture,
    bool profilPictureIsSet = false,
    String? bio,
    String? country,
    String? G__typename,
  }) {
    return GUserProfileFieldsData(
      profileName: profileName ?? this.profileName,
      profilPicture: profilPicture != null || profilPictureIsSet
          ? profilPicture
          : this.profilPicture,
      bio: bio ?? this.bio,
      country: country ?? this.country,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUserProfileFieldsData &&
            profileName == other.profileName &&
            profilPicture == other.profilPicture &&
            bio == other.bio &&
            country == other.country &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, profileName, profilPicture, bio, country, G__typename);
  }

  @override
  String toString() {
    return 'GUserProfileFieldsData(profileName: $profileName, profilPicture: $profilPicture, bio: $bio, country: $country, G__typename: $G__typename)';
  }
}
