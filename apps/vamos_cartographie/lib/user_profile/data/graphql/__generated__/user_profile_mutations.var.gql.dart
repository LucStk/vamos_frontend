// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GcreateProfileVars {
  const GcreateProfileVars({required this.profileName});

  factory GcreateProfileVars.fromJson(Map<String, dynamic> json) {
    return GcreateProfileVars(profileName: (json['profileName'] as String));
  }

  final String profileName;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$profileNameValue = this.profileName;
    _$result['profileName'] = _$profileNameValue;
    return _$result;
  }

  GcreateProfileVars copyWith({String? profileName}) {
    return GcreateProfileVars(profileName: profileName ?? this.profileName);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GcreateProfileVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GcreateProfileVars(profileName: $profileName)';
  }
}
