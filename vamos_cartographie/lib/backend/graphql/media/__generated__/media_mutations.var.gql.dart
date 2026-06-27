// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/backend/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/backend/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GGenerateImageUploadUrlVars {
  const GGenerateImageUploadUrlVars({required this.filename});

  factory GGenerateImageUploadUrlVars.fromJson(Map<String, dynamic> json) {
    return GGenerateImageUploadUrlVars(filename: (json['filename'] as String));
  }

  final String filename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$filenameValue = this.filename;
    _$result['filename'] = _$filenameValue;
    return _$result;
  }

  GGenerateImageUploadUrlVars copyWith({String? filename}) {
    return GGenerateImageUploadUrlVars(filename: filename ?? this.filename);
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
    return 'GGenerateImageUploadUrlVars(filename: $filename)';
  }
}

class GCreateImageVars {
  const GCreateImageVars({required this.fileKey});

  factory GCreateImageVars.fromJson(Map<String, dynamic> json) {
    return GCreateImageVars(fileKey: (json['fileKey'] as String));
  }

  final String fileKey;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$fileKeyValue = this.fileKey;
    _$result['fileKey'] = _$fileKeyValue;
    return _$result;
  }

  GCreateImageVars copyWith({String? fileKey}) {
    return GCreateImageVars(fileKey: fileKey ?? this.fileKey);
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
    return 'GCreateImageVars(fileKey: $fileKey)';
  }
}

class GDeleteImageFromVars {
  const GDeleteImageFromVars({
    required this.id,
    required this.fileKey,
    required this.type,
  });

  factory GDeleteImageFromVars.fromJson(Map<String, dynamic> json) {
    return GDeleteImageFromVars(
      id: (json['id'] as int),
      fileKey: (json['fileKey'] as String),
      type: _i1.GOwnerType.fromJson((json['type'] as String)),
    );
  }

  final int id;

  final String fileKey;

  final _i1.GOwnerType type;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    final _$fileKeyValue = this.fileKey;
    _$result['fileKey'] = _$fileKeyValue;
    final _$typeValue = this.type;
    _$result['type'] = _$typeValue.toJson();
    return _$result;
  }

  GDeleteImageFromVars copyWith({
    int? id,
    String? fileKey,
    _i1.GOwnerType? type,
  }) {
    return GDeleteImageFromVars(
      id: id ?? this.id,
      fileKey: fileKey ?? this.fileKey,
      type: type ?? this.type,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteImageFromVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDeleteImageFromVars(id: $id, fileKey: $fileKey, type: $type)';
  }
}

class GAttachImageToVars {
  const GAttachImageToVars({
    required this.id,
    required this.fileKey,
    required this.type,
  });

  factory GAttachImageToVars.fromJson(Map<String, dynamic> json) {
    return GAttachImageToVars(
      id: (json['id'] as int),
      fileKey: (json['fileKey'] as String),
      type: _i1.GOwnerType.fromJson((json['type'] as String)),
    );
  }

  final int id;

  final String fileKey;

  final _i1.GOwnerType type;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    final _$fileKeyValue = this.fileKey;
    _$result['fileKey'] = _$fileKeyValue;
    final _$typeValue = this.type;
    _$result['type'] = _$typeValue.toJson();
    return _$result;
  }

  GAttachImageToVars copyWith({
    int? id,
    String? fileKey,
    _i1.GOwnerType? type,
  }) {
    return GAttachImageToVars(
      id: id ?? this.id,
      fileKey: fileKey ?? this.fileKey,
      type: type ?? this.type,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachImageToVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GAttachImageToVars(id: $id, fileKey: $fileKey, type: $type)';
  }
}
