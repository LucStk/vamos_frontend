// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i2;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart'
    as _i1;

abstract class GUserProfileFields {
  String get id;
  String get profileName;
  _i1.GStoredFile? get profilePicture;
  String get bio;
  String get G__typename;
}

class GUserProfileFieldsData implements GUserProfileFields {
  const GUserProfileFieldsData({
    required this.id,
    required this.profileName,
    this.profilePicture,
    required this.bio,
    this.G__typename = 'UserProfileType',
  });

  factory GUserProfileFieldsData.fromJson(Map<String, dynamic> json) {
    return GUserProfileFieldsData(
      id: (json['id'] as String),
      profileName: (json['profileName'] as String),
      profilePicture: json['profilePicture'] == null
          ? null
          : _i1.GStoredFileData.fromJson(
              (json['profilePicture'] as Map<String, dynamic>)),
      bio: (json['bio'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String profileName;

  final _i1.GStoredFileData? profilePicture;

  final String bio;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['profileName'] = this.profileName;
    final _$profilePictureValue = this.profilePicture;
    _$result['profilePicture'] =
        _$profilePictureValue == null ? null : _$profilePictureValue.toJson();
    _$result['bio'] = this.bio;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUserProfileFieldsData copyWith({
    String? id,
    String? profileName,
    _i1.GStoredFileData? profilePicture,
    bool profilePictureIsSet = false,
    String? bio,
    String? G__typename,
  }) {
    return GUserProfileFieldsData(
      id: id ?? this.id,
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
            id == other.id &&
            profileName == other.profileName &&
            profilePicture == other.profilePicture &&
            bio == other.bio &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, profileName, profilePicture, bio, G__typename);
  }

  @override
  String toString() {
    return 'GUserProfileFieldsData(id: $id, profileName: $profileName, profilePicture: $profilePicture, bio: $bio, G__typename: $G__typename)';
  }
}

abstract class GCreateProfilePayload {
  String get G__typename;
}

abstract class GCreateProfilePayload__asCreateProfileSuccess
    implements GCreateProfilePayload {
  GUserProfileFields get profile;
  String get G__typename;
}

abstract class GCreateProfilePayload__asCreateProfileError
    implements GCreateProfilePayload {
  _i2.GCreateProfileErrorCode get code;
  String get G__typename;
}

sealed class GCreateProfilePayloadData implements GCreateProfilePayload {
  const GCreateProfilePayloadData({required this.G__typename});

  factory GCreateProfilePayloadData.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'CreateProfileSuccess':
        return GCreateProfilePayloadData__asCreateProfileSuccess.fromJson(json);
      case 'CreateProfileError':
        return GCreateProfilePayloadData__asCreateProfileError.fromJson(json);
      default:
        return GCreateProfilePayloadData__unknown.fromJson(json);
    }
  }

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GCreateProfilePayloadDataWhenExtension on GCreateProfilePayloadData {
  _T when<_T>({
    required _T Function(GCreateProfilePayloadData__asCreateProfileSuccess)
        createProfileSuccess,
    required _T Function(GCreateProfilePayloadData__asCreateProfileError)
        createProfileError,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'CreateProfileSuccess':
        return createProfileSuccess(
            this as GCreateProfilePayloadData__asCreateProfileSuccess);
      case 'CreateProfileError':
        return createProfileError(
            this as GCreateProfilePayloadData__asCreateProfileError);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GCreateProfilePayloadData__asCreateProfileSuccess)?
        createProfileSuccess,
    _T Function(GCreateProfilePayloadData__asCreateProfileError)?
        createProfileError,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'CreateProfileSuccess':
        return createProfileSuccess == null
            ? orElse()
            : createProfileSuccess(
                this as GCreateProfilePayloadData__asCreateProfileSuccess);
      case 'CreateProfileError':
        return createProfileError == null
            ? orElse()
            : createProfileError(
                this as GCreateProfilePayloadData__asCreateProfileError);
      default:
        return orElse();
    }
  }
}

class GCreateProfilePayloadData__asCreateProfileSuccess
    extends GCreateProfilePayloadData
    implements
        GCreateProfilePayload,
        GCreateProfilePayload__asCreateProfileSuccess {
  GCreateProfilePayloadData__asCreateProfileSuccess({
    String G__typename = 'CreateProfileSuccess',
    required this.profile,
  }) : super(G__typename: G__typename);

  factory GCreateProfilePayloadData__asCreateProfileSuccess.fromJson(
      Map<String, dynamic> json) {
    return GCreateProfilePayloadData__asCreateProfileSuccess(
      G__typename: (json['__typename'] as String),
      profile: GUserProfileFieldsData.fromJson(
          (json['profile'] as Map<String, dynamic>)),
    );
  }

  final GUserProfileFieldsData profile;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['profile'] = this.profile.toJson();
    return _$result;
  }

  GCreateProfilePayloadData__asCreateProfileSuccess copyWith({
    String? G__typename,
    GUserProfileFieldsData? profile,
  }) {
    return GCreateProfilePayloadData__asCreateProfileSuccess(
      G__typename: G__typename ?? this.G__typename,
      profile: profile ?? this.profile,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateProfilePayloadData__asCreateProfileSuccess &&
            G__typename == other.G__typename &&
            profile == other.profile);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, profile);
  }

  @override
  String toString() {
    return 'GCreateProfilePayloadData__asCreateProfileSuccess(G__typename: $G__typename, profile: $profile)';
  }
}

class GCreateProfilePayloadData__asCreateProfileError
    extends GCreateProfilePayloadData
    implements
        GCreateProfilePayload,
        GCreateProfilePayload__asCreateProfileError {
  GCreateProfilePayloadData__asCreateProfileError({
    String G__typename = 'CreateProfileError',
    required this.code,
  }) : super(G__typename: G__typename);

  factory GCreateProfilePayloadData__asCreateProfileError.fromJson(
      Map<String, dynamic> json) {
    return GCreateProfilePayloadData__asCreateProfileError(
      G__typename: (json['__typename'] as String),
      code: _i2.GCreateProfileErrorCode.fromJson((json['code'] as String)),
    );
  }

  final _i2.GCreateProfileErrorCode code;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['code'] = this.code.toJson();
    return _$result;
  }

  GCreateProfilePayloadData__asCreateProfileError copyWith({
    String? G__typename,
    _i2.GCreateProfileErrorCode? code,
  }) {
    return GCreateProfilePayloadData__asCreateProfileError(
      G__typename: G__typename ?? this.G__typename,
      code: code ?? this.code,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateProfilePayloadData__asCreateProfileError &&
            G__typename == other.G__typename &&
            code == other.code);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, code);
  }

  @override
  String toString() {
    return 'GCreateProfilePayloadData__asCreateProfileError(G__typename: $G__typename, code: $code)';
  }
}

class GCreateProfilePayloadData__unknown extends GCreateProfilePayloadData
    implements GCreateProfilePayload {
  GCreateProfilePayloadData__unknown({required String G__typename})
      : super(G__typename: G__typename);

  factory GCreateProfilePayloadData__unknown.fromJson(
      Map<String, dynamic> json) {
    return GCreateProfilePayloadData__unknown(
        G__typename: (json['__typename'] as String));
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GCreateProfilePayloadData__unknown copyWith({String? G__typename}) {
    return GCreateProfilePayloadData__unknown(
        G__typename: G__typename ?? this.G__typename);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateProfilePayloadData__unknown &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename);
  }

  @override
  String toString() {
    return 'GCreateProfilePayloadData__unknown(G__typename: $G__typename)';
  }
}
