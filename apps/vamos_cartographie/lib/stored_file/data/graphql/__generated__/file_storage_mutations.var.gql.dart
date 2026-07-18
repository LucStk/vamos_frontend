// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GGenerateImageUploadUrlVars {
  const GGenerateImageUploadUrlVars({required this.input});

  factory GGenerateImageUploadUrlVars.fromJson(Map<String, dynamic> json) {
    return GGenerateImageUploadUrlVars(
        input: _i1.GImageUploadRequest.fromJson(
            (json['input'] as Map<String, dynamic>)));
  }

  final _i1.GImageUploadRequest input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GGenerateImageUploadUrlVars copyWith({_i1.GImageUploadRequest? input}) {
    return GGenerateImageUploadUrlVars(input: input ?? this.input);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGenerateImageUploadUrlVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GGenerateImageUploadUrlVars(input: $input)';
  }
}

class GDetachFileVars {
  const GDetachFileVars({required this.input});

  factory GDetachFileVars.fromJson(Map<String, dynamic> json) {
    return GDetachFileVars(
        input: _i1.GDetachFileInput.fromJson(
            (json['input'] as Map<String, dynamic>)));
  }

  final _i1.GDetachFileInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GDetachFileVars copyWith({_i1.GDetachFileInput? input}) {
    return GDetachFileVars(input: input ?? this.input);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDetachFileVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDetachFileVars(input: $input)';
  }
}

class GAttachFileVars {
  const GAttachFileVars({required this.input});

  factory GAttachFileVars.fromJson(Map<String, dynamic> json) {
    return GAttachFileVars(
        input: _i1.GAttachFileInput.fromJson(
            (json['input'] as Map<String, dynamic>)));
  }

  final _i1.GAttachFileInput input;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$inputValue = this.input;
    _$result['input'] = _$inputValue.toJson();
    return _$result;
  }

  GAttachFileVars copyWith({_i1.GAttachFileInput? input}) {
    return GAttachFileVars(input: input ?? this.input);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachFileVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GAttachFileVars(input: $input)';
  }
}
