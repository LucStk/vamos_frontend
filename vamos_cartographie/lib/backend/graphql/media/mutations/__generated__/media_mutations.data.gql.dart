// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/backend/graphql/media/fragments/__generated__/image_fields.data.gql.dart'
    as _i1;

class GGenerateImageUploadUrlData {
  const GGenerateImageUploadUrlData({
    required this.generateImageUploadUrl,
    this.G__typename = 'Mutation',
  });

  factory GGenerateImageUploadUrlData.fromJson(Map<String, dynamic> json) {
    return GGenerateImageUploadUrlData(
      generateImageUploadUrl:
          GGenerateImageUploadUrlData_generateImageUploadUrl.fromJson(
              (json['generateImageUploadUrl'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GGenerateImageUploadUrlData_generateImageUploadUrl
      generateImageUploadUrl;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['generateImageUploadUrl'] = this.generateImageUploadUrl.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGenerateImageUploadUrlData copyWith({
    GGenerateImageUploadUrlData_generateImageUploadUrl? generateImageUploadUrl,
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

class GGenerateImageUploadUrlData_generateImageUploadUrl {
  const GGenerateImageUploadUrlData_generateImageUploadUrl({
    required this.fileKey,
    required this.uploadUrl,
    this.G__typename = 'UploadConfig',
  });

  factory GGenerateImageUploadUrlData_generateImageUploadUrl.fromJson(
      Map<String, dynamic> json) {
    return GGenerateImageUploadUrlData_generateImageUploadUrl(
      fileKey: (json['fileKey'] as String),
      uploadUrl: (json['uploadUrl'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String fileKey;

  final String uploadUrl;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['fileKey'] = this.fileKey;
    _$result['uploadUrl'] = this.uploadUrl;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGenerateImageUploadUrlData_generateImageUploadUrl copyWith({
    String? fileKey,
    String? uploadUrl,
    String? G__typename,
  }) {
    return GGenerateImageUploadUrlData_generateImageUploadUrl(
      fileKey: fileKey ?? this.fileKey,
      uploadUrl: uploadUrl ?? this.uploadUrl,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGenerateImageUploadUrlData_generateImageUploadUrl &&
            fileKey == other.fileKey &&
            uploadUrl == other.uploadUrl &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, fileKey, uploadUrl, G__typename);
  }

  @override
  String toString() {
    return 'GGenerateImageUploadUrlData_generateImageUploadUrl(fileKey: $fileKey, uploadUrl: $uploadUrl, G__typename: $G__typename)';
  }
}

class GCreateImageData {
  const GCreateImageData({
    required this.createImage,
    this.G__typename = 'Mutation',
  });

  factory GCreateImageData.fromJson(Map<String, dynamic> json) {
    return GCreateImageData(
      createImage: _i1.GImageFieldsData.fromJson(
          (json['createImage'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GImageFieldsData createImage;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createImage'] = this.createImage.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateImageData copyWith({
    _i1.GImageFieldsData? createImage,
    String? G__typename,
  }) {
    return GCreateImageData(
      createImage: createImage ?? this.createImage,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateImageData &&
            createImage == other.createImage &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createImage, G__typename);
  }

  @override
  String toString() {
    return 'GCreateImageData(createImage: $createImage, G__typename: $G__typename)';
  }
}
