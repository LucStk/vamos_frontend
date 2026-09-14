// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

class GcreateProfileData {
  const GcreateProfileData({
    required this.createProfile,
    this.G__typename = 'Mutation',
  });

  factory GcreateProfileData.fromJson(Map<String, dynamic> json) {
    return GcreateProfileData(
      createProfile: GcreateProfileData_createProfile.fromJson(
          (json['createProfile'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GcreateProfileData_createProfile createProfile;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createProfile'] = this.createProfile.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GcreateProfileData copyWith({
    GcreateProfileData_createProfile? createProfile,
    String? G__typename,
  }) {
    return GcreateProfileData(
      createProfile: createProfile ?? this.createProfile,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GcreateProfileData &&
            createProfile == other.createProfile &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createProfile, G__typename);
  }

  @override
  String toString() {
    return 'GcreateProfileData(createProfile: $createProfile, G__typename: $G__typename)';
  }
}

sealed class GcreateProfileData_createProfile {
  const GcreateProfileData_createProfile({required this.G__typename});

  factory GcreateProfileData_createProfile.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'] as String) {
      case 'CreateProfileSuccess':
        return GcreateProfileData_createProfile__asCreateProfileSuccess
            .fromJson(json);
      case 'UsernameAlreadyTaken':
        return GcreateProfileData_createProfile__asUsernameAlreadyTaken
            .fromJson(json);
      case 'InvalidUsername':
        return GcreateProfileData_createProfile__asInvalidUsername.fromJson(
            json);
      default:
        return GcreateProfileData_createProfile__unknown.fromJson(json);
    }
  }

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['__typename'] = this.G__typename;
    return _$result;
  }
}

extension GcreateProfileData_createProfileWhenExtension
    on GcreateProfileData_createProfile {
  _T when<_T>({
    required _T Function(
            GcreateProfileData_createProfile__asCreateProfileSuccess)
        createProfileSuccess,
    required _T Function(
            GcreateProfileData_createProfile__asUsernameAlreadyTaken)
        usernameAlreadyTaken,
    required _T Function(GcreateProfileData_createProfile__asInvalidUsername)
        invalidUsername,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'CreateProfileSuccess':
        return createProfileSuccess(
            this as GcreateProfileData_createProfile__asCreateProfileSuccess);
      case 'UsernameAlreadyTaken':
        return usernameAlreadyTaken(
            this as GcreateProfileData_createProfile__asUsernameAlreadyTaken);
      case 'InvalidUsername':
        return invalidUsername(
            this as GcreateProfileData_createProfile__asInvalidUsername);
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GcreateProfileData_createProfile__asCreateProfileSuccess)?
        createProfileSuccess,
    _T Function(GcreateProfileData_createProfile__asUsernameAlreadyTaken)?
        usernameAlreadyTaken,
    _T Function(GcreateProfileData_createProfile__asInvalidUsername)?
        invalidUsername,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'CreateProfileSuccess':
        return createProfileSuccess == null
            ? orElse()
            : createProfileSuccess(this
                as GcreateProfileData_createProfile__asCreateProfileSuccess);
      case 'UsernameAlreadyTaken':
        return usernameAlreadyTaken == null
            ? orElse()
            : usernameAlreadyTaken(this
                as GcreateProfileData_createProfile__asUsernameAlreadyTaken);
      case 'InvalidUsername':
        return invalidUsername == null
            ? orElse()
            : invalidUsername(
                this as GcreateProfileData_createProfile__asInvalidUsername);
      default:
        return orElse();
    }
  }
}

class GcreateProfileData_createProfile__asCreateProfileSuccess
    extends GcreateProfileData_createProfile {
  GcreateProfileData_createProfile__asCreateProfileSuccess({
    String G__typename = 'CreateProfileSuccess',
    required this.profile,
  }) : super(G__typename: G__typename);

  factory GcreateProfileData_createProfile__asCreateProfileSuccess.fromJson(
      Map<String, dynamic> json) {
    return GcreateProfileData_createProfile__asCreateProfileSuccess(
      G__typename: (json['__typename'] as String),
      profile: GcreateProfileData_createProfile__asCreateProfileSuccess_profile
          .fromJson((json['profile'] as Map<String, dynamic>)),
    );
  }

  final GcreateProfileData_createProfile__asCreateProfileSuccess_profile
      profile;

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    _$result['profile'] = this.profile.toJson();
    return _$result;
  }

  GcreateProfileData_createProfile__asCreateProfileSuccess copyWith({
    String? G__typename,
    GcreateProfileData_createProfile__asCreateProfileSuccess_profile? profile,
  }) {
    return GcreateProfileData_createProfile__asCreateProfileSuccess(
      G__typename: G__typename ?? this.G__typename,
      profile: profile ?? this.profile,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GcreateProfileData_createProfile__asCreateProfileSuccess &&
            G__typename == other.G__typename &&
            profile == other.profile);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, profile);
  }

  @override
  String toString() {
    return 'GcreateProfileData_createProfile__asCreateProfileSuccess(G__typename: $G__typename, profile: $profile)';
  }
}

class GcreateProfileData_createProfile__asCreateProfileSuccess_profile {
  const GcreateProfileData_createProfile__asCreateProfileSuccess_profile({
    required this.bio,
    this.G__typename = 'UserProfileType',
  });

  factory GcreateProfileData_createProfile__asCreateProfileSuccess_profile.fromJson(
      Map<String, dynamic> json) {
    return GcreateProfileData_createProfile__asCreateProfileSuccess_profile(
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

  GcreateProfileData_createProfile__asCreateProfileSuccess_profile copyWith({
    String? bio,
    String? G__typename,
  }) {
    return GcreateProfileData_createProfile__asCreateProfileSuccess_profile(
      bio: bio ?? this.bio,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GcreateProfileData_createProfile__asCreateProfileSuccess_profile &&
            bio == other.bio &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, bio, G__typename);
  }

  @override
  String toString() {
    return 'GcreateProfileData_createProfile__asCreateProfileSuccess_profile(bio: $bio, G__typename: $G__typename)';
  }
}

class GcreateProfileData_createProfile__asUsernameAlreadyTaken
    extends GcreateProfileData_createProfile {
  GcreateProfileData_createProfile__asUsernameAlreadyTaken({
    String G__typename = 'UsernameAlreadyTaken',
    required this.message,
  }) : super(G__typename: G__typename);

  factory GcreateProfileData_createProfile__asUsernameAlreadyTaken.fromJson(
      Map<String, dynamic> json) {
    return GcreateProfileData_createProfile__asUsernameAlreadyTaken(
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

  GcreateProfileData_createProfile__asUsernameAlreadyTaken copyWith({
    String? G__typename,
    String? message,
  }) {
    return GcreateProfileData_createProfile__asUsernameAlreadyTaken(
      G__typename: G__typename ?? this.G__typename,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GcreateProfileData_createProfile__asUsernameAlreadyTaken &&
            G__typename == other.G__typename &&
            message == other.message);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, message);
  }

  @override
  String toString() {
    return 'GcreateProfileData_createProfile__asUsernameAlreadyTaken(G__typename: $G__typename, message: $message)';
  }
}

class GcreateProfileData_createProfile__asInvalidUsername
    extends GcreateProfileData_createProfile {
  GcreateProfileData_createProfile__asInvalidUsername({
    String G__typename = 'InvalidUsername',
    required this.message,
  }) : super(G__typename: G__typename);

  factory GcreateProfileData_createProfile__asInvalidUsername.fromJson(
      Map<String, dynamic> json) {
    return GcreateProfileData_createProfile__asInvalidUsername(
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

  GcreateProfileData_createProfile__asInvalidUsername copyWith({
    String? G__typename,
    String? message,
  }) {
    return GcreateProfileData_createProfile__asInvalidUsername(
      G__typename: G__typename ?? this.G__typename,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GcreateProfileData_createProfile__asInvalidUsername &&
            G__typename == other.G__typename &&
            message == other.message);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename, message);
  }

  @override
  String toString() {
    return 'GcreateProfileData_createProfile__asInvalidUsername(G__typename: $G__typename, message: $message)';
  }
}

class GcreateProfileData_createProfile__unknown
    extends GcreateProfileData_createProfile {
  GcreateProfileData_createProfile__unknown({required String G__typename})
      : super(G__typename: G__typename);

  factory GcreateProfileData_createProfile__unknown.fromJson(
      Map<String, dynamic> json) {
    return GcreateProfileData_createProfile__unknown(
        G__typename: (json['__typename'] as String));
  }

  Map<String, dynamic> toJson() {
    final _$result = super.toJson();
    return _$result;
  }

  GcreateProfileData_createProfile__unknown copyWith({String? G__typename}) {
    return GcreateProfileData_createProfile__unknown(
        G__typename: G__typename ?? this.G__typename);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GcreateProfileData_createProfile__unknown &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, G__typename);
  }

  @override
  String toString() {
    return 'GcreateProfileData_createProfile__unknown(G__typename: $G__typename)';
  }
}
