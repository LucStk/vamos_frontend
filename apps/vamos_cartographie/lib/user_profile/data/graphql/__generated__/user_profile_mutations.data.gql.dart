// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/user_profile/data/graphql/__generated__/user_profile_fields.data.gql.dart'
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
      case 'UsernameAlreadyTaken':
        return GCreateProfileData_createProfile__asUsernameAlreadyTaken
            .fromJson(json);
      case 'InvalidUsername':
        return GCreateProfileData_createProfile__asInvalidUsername.fromJson(
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
    required _T Function(
            GCreateProfileData_createProfile__asUsernameAlreadyTaken)
        usernameAlreadyTaken,
    required _T Function(GCreateProfileData_createProfile__asInvalidUsername)
        invalidUsername,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'CreateProfileSuccess':
        return createProfileSuccess(
            this as GCreateProfileData_createProfile__asCreateProfileSuccess);
      case 'UsernameAlreadyTaken':
        return usernameAlreadyTaken(
            this as GCreateProfileData_createProfile__asUsernameAlreadyTaken);
      case 'InvalidUsername':
        return invalidUsername(
            this as GCreateProfileData_createProfile__asInvalidUsername);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GCreateProfileData_createProfile__asCreateProfileSuccess)?
        createProfileSuccess,
    _T Function(GCreateProfileData_createProfile__asUsernameAlreadyTaken)?
        usernameAlreadyTaken,
    _T Function(GCreateProfileData_createProfile__asInvalidUsername)?
        invalidUsername,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'CreateProfileSuccess':
        return createProfileSuccess == null
            ? orElse()
            : createProfileSuccess(this
                as GCreateProfileData_createProfile__asCreateProfileSuccess);
      case 'UsernameAlreadyTaken':
        return usernameAlreadyTaken == null
            ? orElse()
            : usernameAlreadyTaken(this
                as GCreateProfileData_createProfile__asUsernameAlreadyTaken);
      case 'InvalidUsername':
        return invalidUsername == null
            ? orElse()
            : invalidUsername(
                this as GCreateProfileData_createProfile__asInvalidUsername);
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
      profile: GCreateProfileData_createProfile__asCreateProfileSuccess_profile
          .fromJson((json['profile'] as Map<String, dynamic>)),
    );
  }

  final GCreateProfileData_createProfile__asCreateProfileSuccess_profile
      profile;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['profile'] = this.profile.toJson();
    return _$result;
  }

  GCreateProfileData_createProfile__asCreateProfileSuccess copyWith({
    String? G__typename,
    GCreateProfileData_createProfile__asCreateProfileSuccess_profile? profile,
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

class GCreateProfileData_createProfile__asCreateProfileSuccess_profile {
  const GCreateProfileData_createProfile__asCreateProfileSuccess_profile({
    required this.bio,
    this.G__typename = 'UserProfileType',
  });

  factory GCreateProfileData_createProfile__asCreateProfileSuccess_profile.fromJson(
      Map<String, dynamic> json) {
    return GCreateProfileData_createProfile__asCreateProfileSuccess_profile(
      bio: (json['bio'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String bio;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['bio'] = this.bio;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateProfileData_createProfile__asCreateProfileSuccess_profile copyWith({
    String? bio,
    String? G__typename,
  }) {
    return GCreateProfileData_createProfile__asCreateProfileSuccess_profile(
      bio: bio ?? this.bio,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateProfileData_createProfile__asCreateProfileSuccess_profile &&
            bio == other.bio &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, bio, G__typename);
  }

  @override
  String toString() {
    return 'GCreateProfileData_createProfile__asCreateProfileSuccess_profile(bio: $bio, G__typename: $G__typename)';
  }
}

class GCreateProfileData_createProfile__asUsernameAlreadyTaken
    extends GCreateProfileData_createProfile {
  GCreateProfileData_createProfile__asUsernameAlreadyTaken({
    String G__typename = 'UsernameAlreadyTaken',
    required this.message,
  }) : super(G__typename: G__typename);

  factory GCreateProfileData_createProfile__asUsernameAlreadyTaken.fromJson(
      Map<String, dynamic> json) {
    return GCreateProfileData_createProfile__asUsernameAlreadyTaken(
      G__typename: (json['__typename'] as String),
      message: (json['message'] as String),
    );
  }

  final String message;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['message'] = this.message;
    return _$result;
  }

  GCreateProfileData_createProfile__asUsernameAlreadyTaken copyWith({
    String? G__typename,
    String? message,
  }) {
    return GCreateProfileData_createProfile__asUsernameAlreadyTaken(
      G__typename: G__typename ?? this.G__typename,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateProfileData_createProfile__asUsernameAlreadyTaken &&
            G__typename == other.G__typename &&
            message == other.message);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, message);
  }

  @override
  String toString() {
    return 'GCreateProfileData_createProfile__asUsernameAlreadyTaken(G__typename: $G__typename, message: $message)';
  }
}

class GCreateProfileData_createProfile__asInvalidUsername
    extends GCreateProfileData_createProfile {
  GCreateProfileData_createProfile__asInvalidUsername({
    String G__typename = 'InvalidUsername',
    required this.message,
  }) : super(G__typename: G__typename);

  factory GCreateProfileData_createProfile__asInvalidUsername.fromJson(
      Map<String, dynamic> json) {
    return GCreateProfileData_createProfile__asInvalidUsername(
      G__typename: (json['__typename'] as String),
      message: (json['message'] as String),
    );
  }

  final String message;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['message'] = this.message;
    return _$result;
  }

  GCreateProfileData_createProfile__asInvalidUsername copyWith({
    String? G__typename,
    String? message,
  }) {
    return GCreateProfileData_createProfile__asInvalidUsername(
      G__typename: G__typename ?? this.G__typename,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateProfileData_createProfile__asInvalidUsername &&
            G__typename == other.G__typename &&
            message == other.message);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, message);
  }

  @override
  String toString() {
    return 'GCreateProfileData_createProfile__asInvalidUsername(G__typename: $G__typename, message: $message)';
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
