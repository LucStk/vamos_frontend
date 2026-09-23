// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GCreateProfileVars {
  const GCreateProfileVars({required this.profileName});

  factory GCreateProfileVars.fromJson(Map<String, dynamic> json) {
    return GCreateProfileVars(profileName: (json['profileName'] as String));
  }

  final String profileName;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$profileNameValue = this.profileName;
    _$result['profileName'] = _$profileNameValue;
    return _$result;
  }

  GCreateProfileVars copyWith({String? profileName}) {
    return GCreateProfileVars(profileName: profileName ?? this.profileName);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateProfileVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCreateProfileVars(profileName: $profileName)';
  }
}

class GUpdateProfileVars {
  const GUpdateProfileVars({required this.input});

  factory GUpdateProfileVars.fromJson(Map<String, dynamic> json) {
    return GUpdateProfileVars(
        input: _i1.GUpdateUserProfileInput.fromJson(
            (json['input'] as Map<String, dynamic>)));
  }

  final _i1.GUpdateUserProfileInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GUpdateProfileVars copyWith({_i1.GUpdateUserProfileInput? input}) {
    return GUpdateProfileVars(input: input ?? this.input);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateProfileVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GUpdateProfileVars(input: $input)';
  }
}
