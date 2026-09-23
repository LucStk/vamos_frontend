// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
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
    required this.userId,
    this.profile,
    this.G__typename = 'GetMePayload',
  });

  factory GGetMeData_me.fromJson(Map<String, dynamic> json) {
    return GGetMeData_me(
      userId: (json['userId'] as String),
      profile: json['profile'] == null
          ? null
          : _i1.GUserProfileFieldsData.fromJson(
              (json['profile'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final String userId;

  final _i1.GUserProfileFieldsData? profile;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['userId'] = this.userId;
    final _$profileValue = this.profile;
    _$result['profile'] =
        _$profileValue == null ? null : _$profileValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetMeData_me copyWith({
    String? userId,
    _i1.GUserProfileFieldsData? profile,
    bool profileIsSet = false,
    String? G__typename,
  }) {
    return GGetMeData_me(
      userId: userId ?? this.userId,
      profile: profile != null || profileIsSet ? profile : this.profile,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetMeData_me &&
            userId == other.userId &&
            profile == other.profile &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, userId, profile, G__typename);
  }

  @override
  String toString() {
    return 'GGetMeData_me(userId: $userId, profile: $profile, G__typename: $G__typename)';
  }
}
