// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i2;
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_fields.data.gql.dart'
    as _i1;

class GCreateProfileData {
  const GCreateProfileData({
    required this.createProfile,
    this.G__typename = 'Mutation',
  });

  factory GCreateProfileData.fromJson(Map<String, dynamic> json) {
    return GCreateProfileData(
      createProfile: GCreateProfileData_createProfile.fromJson(
          (json['createProfile'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GCreateProfileData_createProfile createProfile;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createProfile'] = this.createProfile.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateProfileData copyWith({
    GCreateProfileData_createProfile? createProfile,
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

sealed class GCreateProfileData_createProfile {
  const GCreateProfileData_createProfile({required this.G__typename});

  factory GCreateProfileData_createProfile.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'CreateProfileSuccess':
        return GCreateProfileData_createProfile__asCreateProfileSuccess
            .fromJson(json);
      case 'CreateProfileError':
        return GCreateProfileData_createProfile__asCreateProfileError.fromJson(
            json);
      default:
        return GCreateProfileData_createProfile__unknown.fromJson(json);
    }
  }

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GCreateProfileData_createProfileWhenExtension
    on GCreateProfileData_createProfile {
  _T when<_T>({
    required _T Function(
            GCreateProfileData_createProfile__asCreateProfileSuccess)
        createProfileSuccess,
    required _T Function(GCreateProfileData_createProfile__asCreateProfileError)
        createProfileError,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'CreateProfileSuccess':
        return createProfileSuccess(
            this as GCreateProfileData_createProfile__asCreateProfileSuccess);
      case 'CreateProfileError':
        return createProfileError(
            this as GCreateProfileData_createProfile__asCreateProfileError);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GCreateProfileData_createProfile__asCreateProfileSuccess)?
        createProfileSuccess,
    _T Function(GCreateProfileData_createProfile__asCreateProfileError)?
        createProfileError,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'CreateProfileSuccess':
        return createProfileSuccess == null
            ? orElse()
            : createProfileSuccess(this
                as GCreateProfileData_createProfile__asCreateProfileSuccess);
      case 'CreateProfileError':
        return createProfileError == null
            ? orElse()
            : createProfileError(
                this as GCreateProfileData_createProfile__asCreateProfileError);
      default:
        return orElse();
    }
  }
}

class GCreateProfileData_createProfile__asCreateProfileSuccess
    extends GCreateProfileData_createProfile {
  GCreateProfileData_createProfile__asCreateProfileSuccess({
    String G__typename = 'CreateProfileSuccess',
    required this.profile,
  }) : super(G__typename: G__typename);

  factory GCreateProfileData_createProfile__asCreateProfileSuccess.fromJson(
      Map<String, dynamic> json) {
    return GCreateProfileData_createProfile__asCreateProfileSuccess(
      G__typename: (json['__typename'] as String),
      profile: _i1.GUserProfileFieldsData.fromJson(
          (json['profile'] as Map<String, dynamic>)),
    );
  }

  final _i1.GUserProfileFieldsData profile;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['profile'] = this.profile.toJson();
    return _$result;
  }

  GCreateProfileData_createProfile__asCreateProfileSuccess copyWith({
    String? G__typename,
    _i1.GUserProfileFieldsData? profile,
  }) {
    return GCreateProfileData_createProfile__asCreateProfileSuccess(
      G__typename: G__typename ?? this.G__typename,
      profile: profile ?? this.profile,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateProfileData_createProfile__asCreateProfileSuccess &&
            G__typename == other.G__typename &&
            profile == other.profile);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, profile);
  }

  @override
  String toString() {
    return 'GCreateProfileData_createProfile__asCreateProfileSuccess(G__typename: $G__typename, profile: $profile)';
  }
}

class GCreateProfileData_createProfile__asCreateProfileError
    extends GCreateProfileData_createProfile {
  GCreateProfileData_createProfile__asCreateProfileError({
    String G__typename = 'CreateProfileError',
    required this.code,
  }) : super(G__typename: G__typename);

  factory GCreateProfileData_createProfile__asCreateProfileError.fromJson(
      Map<String, dynamic> json) {
    return GCreateProfileData_createProfile__asCreateProfileError(
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

  GCreateProfileData_createProfile__asCreateProfileError copyWith({
    String? G__typename,
    _i2.GCreateProfileErrorCode? code,
  }) {
    return GCreateProfileData_createProfile__asCreateProfileError(
      G__typename: G__typename ?? this.G__typename,
      code: code ?? this.code,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateProfileData_createProfile__asCreateProfileError &&
            G__typename == other.G__typename &&
            code == other.code);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, code);
  }

  @override
  String toString() {
    return 'GCreateProfileData_createProfile__asCreateProfileError(G__typename: $G__typename, code: $code)';
  }
}

class GCreateProfileData_createProfile__unknown
    extends GCreateProfileData_createProfile {
  GCreateProfileData_createProfile__unknown({required String G__typename})
      : super(G__typename: G__typename);

  factory GCreateProfileData_createProfile__unknown.fromJson(
      Map<String, dynamic> json) {
    return GCreateProfileData_createProfile__unknown(
        G__typename: (json['__typename'] as String));
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GCreateProfileData_createProfile__unknown copyWith({String? G__typename}) {
    return GCreateProfileData_createProfile__unknown(
        G__typename: G__typename ?? this.G__typename);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateProfileData_createProfile__unknown &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename);
  }

  @override
  String toString() {
    return 'GCreateProfileData_createProfile__unknown(G__typename: $G__typename)';
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
