// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart'
    as _i1;

class GGenerateImageUploadUrlData {
  const GGenerateImageUploadUrlData({
    required this.generateImageUploadUrl,
    this.G__typename = 'Mutation',
  });

  factory GGenerateImageUploadUrlData.fromJson(Map<String, dynamic> json) {
    return GGenerateImageUploadUrlData(
      generateImageUploadUrl: _i1.GUploadConfigFieldsData.fromJson(
          (json['generateImageUploadUrl'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GUploadConfigFieldsData generateImageUploadUrl;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['generateImageUploadUrl'] = this.generateImageUploadUrl.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGenerateImageUploadUrlData copyWith({
    _i1.GUploadConfigFieldsData? generateImageUploadUrl,
    String? G__typename,
  }) {
    return GGenerateImageUploadUrlData(
      generateImageUploadUrl:
          generateImageUploadUrl ?? this.generateImageUploadUrl,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGenerateImageUploadUrlData &&
            generateImageUploadUrl == other.generateImageUploadUrl &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, generateImageUploadUrl, G__typename);
  }

  @override
  String toString() {
    return 'GGenerateImageUploadUrlData(generateImageUploadUrl: $generateImageUploadUrl, G__typename: $G__typename)';
  }
}

class GDetachFileData {
  const GDetachFileData({
    required this.detachFile,
    this.G__typename = 'Mutation',
  });

  factory GDetachFileData.fromJson(Map<String, dynamic> json) {
    return GDetachFileData(
      detachFile: (json['detachFile'] as bool),
      G__typename: (json['__typename'] as String),
    );
  }

  final bool detachFile;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['detachFile'] = this.detachFile;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDetachFileData copyWith({
    bool? detachFile,
    String? G__typename,
  }) {
    return GDetachFileData(
      detachFile: detachFile ?? this.detachFile,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDetachFileData &&
            detachFile == other.detachFile &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, detachFile, G__typename);
  }

  @override
  String toString() {
    return 'GDetachFileData(detachFile: $detachFile, G__typename: $G__typename)';
  }
}

class GAttachFileData {
  const GAttachFileData({
    required this.attachFile,
    this.G__typename = 'Mutation',
  });

  factory GAttachFileData.fromJson(Map<String, dynamic> json) {
    return GAttachFileData(
      attachFile: _i1.GFileAttachmentData.fromJson(
          (json['attachFile'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GFileAttachmentData attachFile;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['attachFile'] = this.attachFile.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GAttachFileData copyWith({
    _i1.GFileAttachmentData? attachFile,
    String? G__typename,
  }) {
    return GAttachFileData(
      attachFile: attachFile ?? this.attachFile,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachFileData &&
            attachFile == other.attachFile &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, attachFile, G__typename);
  }

  @override
  String toString() {
    return 'GAttachFileData(attachFile: $attachFile, G__typename: $G__typename)';
  }
}

class GReorderFilesData {
  const GReorderFilesData({
    required this.reorderFiles,
    this.G__typename = 'Mutation',
  });

  factory GReorderFilesData.fromJson(Map<String, dynamic> json) {
    return GReorderFilesData(
      reorderFiles: (json['reorderFiles'] as List<dynamic>)
          .map((_$e) =>
              _i1.GFileAttachmentData.fromJson((_$e as Map<String, dynamic>)))
          .toList(),
      G__typename: (json['__typename'] as String),
    );
  }

  final List<_i1.GFileAttachmentData> reorderFiles;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['reorderFiles'] =
        this.reorderFiles.map((_$e) => _$e.toJson()).toList();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GReorderFilesData copyWith({
    List<_i1.GFileAttachmentData>? reorderFiles,
    String? G__typename,
  }) {
    return GReorderFilesData(
      reorderFiles: reorderFiles ?? this.reorderFiles,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GReorderFilesData &&
            _gqlUtils.listEquals(reorderFiles, other.reorderFiles) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, _gqlUtils.listHash(reorderFiles), G__typename);
  }

  @override
  String toString() {
    return 'GReorderFilesData(reorderFiles: $reorderFiles, G__typename: $G__typename)';
  }
}

class GSetFileCaptionData {
  const GSetFileCaptionData({
    required this.setFileCaption,
    this.G__typename = 'Mutation',
  });

  factory GSetFileCaptionData.fromJson(Map<String, dynamic> json) {
    return GSetFileCaptionData(
      setFileCaption: _i1.GFileAttachmentData.fromJson(
          (json['setFileCaption'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GFileAttachmentData setFileCaption;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['setFileCaption'] = this.setFileCaption.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSetFileCaptionData copyWith({
    _i1.GFileAttachmentData? setFileCaption,
    String? G__typename,
  }) {
    return GSetFileCaptionData(
      setFileCaption: setFileCaption ?? this.setFileCaption,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetFileCaptionData &&
            setFileCaption == other.setFileCaption &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, setFileCaption, G__typename);
  }

  @override
  String toString() {
    return 'GSetFileCaptionData(setFileCaption: $setFileCaption, G__typename: $G__typename)';
  }
}
