// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/user_profile/data/graphql/__generated__/user_profile_fields.data.gql.dart'
    as _i1;

class GGetMeData {
  const GGetMeData({
    this.me,
    this.G__typename = 'Query',
  });

  factory GGetMeData.fromJson(Map<String, dynamic> json) {
    return GGetMeData(
      me: json['me'] == null
          ? null
          : _i1.GUserProfileFieldsData.fromJson(
              (json['me'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GUserProfileFieldsData? me;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$meValue = this.me;
    _$result['me'] = _$meValue == null ? null : _$meValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetMeData copyWith({
    _i1.GUserProfileFieldsData? me,
    bool meIsSet = false,
    String? G__typename,
  }) {
    return GGetMeData(
      me: me != null || meIsSet ? me : this.me,
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
