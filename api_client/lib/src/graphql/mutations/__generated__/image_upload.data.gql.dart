// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

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

class GConfirmImageUploadData {
  const GConfirmImageUploadData({
    required this.confirmImageUpload,
    this.G__typename = 'Mutation',
  });

  factory GConfirmImageUploadData.fromJson(Map<String, dynamic> json) {
    return GConfirmImageUploadData(
      confirmImageUpload: GConfirmImageUploadData_confirmImageUpload.fromJson(
          (json['confirmImageUpload'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GConfirmImageUploadData_confirmImageUpload confirmImageUpload;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['confirmImageUpload'] = this.confirmImageUpload.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GConfirmImageUploadData copyWith({
    GConfirmImageUploadData_confirmImageUpload? confirmImageUpload,
    String? G__typename,
  }) {
    return GConfirmImageUploadData(
      confirmImageUpload: confirmImageUpload ?? this.confirmImageUpload,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GConfirmImageUploadData &&
            confirmImageUpload == other.confirmImageUpload &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, confirmImageUpload, G__typename);
  }

  @override
  String toString() {
    return 'GConfirmImageUploadData(confirmImageUpload: $confirmImageUpload, G__typename: $G__typename)';
  }
}

class GConfirmImageUploadData_confirmImageUpload {
  const GConfirmImageUploadData_confirmImageUpload({
    required this.urlLink,
    this.G__typename = 'UploadConfirmation',
  });

  factory GConfirmImageUploadData_confirmImageUpload.fromJson(
      Map<String, dynamic> json) {
    return GConfirmImageUploadData_confirmImageUpload(
      urlLink: (json['urlLink'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String urlLink;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['urlLink'] = this.urlLink;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GConfirmImageUploadData_confirmImageUpload copyWith({
    String? urlLink,
    String? G__typename,
  }) {
    return GConfirmImageUploadData_confirmImageUpload(
      urlLink: urlLink ?? this.urlLink,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GConfirmImageUploadData_confirmImageUpload &&
            urlLink == other.urlLink &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, urlLink, G__typename);
  }

  @override
  String toString() {
    return 'GConfirmImageUploadData_confirmImageUpload(urlLink: $urlLink, G__typename: $G__typename)';
  }
}
