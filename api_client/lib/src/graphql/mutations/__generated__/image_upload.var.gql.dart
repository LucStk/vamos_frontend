// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:api_client/src/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GGenerateImageUploadUrlVars {
  const GGenerateImageUploadUrlVars({required this.extension});

  factory GGenerateImageUploadUrlVars.fromJson(Map<String, dynamic> json) {
    return GGenerateImageUploadUrlVars(
        extension: (json['extension'] as String));
  }

  final String extension;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$extensionValue = this.extension;
    _$result['extension'] = _$extensionValue;
    return _$result;
  }

  GGenerateImageUploadUrlVars copyWith({String? extension}) {
    return GGenerateImageUploadUrlVars(extension: extension ?? this.extension);
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
    return 'GGenerateImageUploadUrlVars(extension: $extension)';
  }
}

class GCreateImageVars {
  const GCreateImageVars({required this.image});

  factory GCreateImageVars.fromJson(Map<String, dynamic> json) {
    return GCreateImageVars(
        image:
            _i1.GImageInput.fromJson((json['image'] as Map<String, dynamic>)));
  }

  final _i1.GImageInput image;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$imageValue = this.image;
    _$result['image'] = _$imageValue.toJson();
    return _$result;
  }

  GCreateImageVars copyWith({_i1.GImageInput? image}) {
    return GCreateImageVars(image: image ?? this.image);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateImageVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCreateImageVars(image: $image)';
  }
}
