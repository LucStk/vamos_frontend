// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

abstract class GStoredFile {
  String get id;
  String get filename;
  String get status;
  String get url;
  String get G__typename;
}

class GStoredFileData implements GStoredFile {
  const GStoredFileData({
    required this.id,
    required this.filename,
    required this.status,
    required this.url,
    this.G__typename = 'StoredFileType',
  });

  factory GStoredFileData.fromJson(Map<String, dynamic> json) {
    return GStoredFileData(
      id: (json['id'] as String),
      filename: (json['filename'] as String),
      status: (json['status'] as String),
      url: (json['url'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String filename;

  final String status;

  final String url;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['filename'] = this.filename;
    _$result['status'] = this.status;
    _$result['url'] = this.url;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GStoredFileData copyWith({
    String? id,
    String? filename,
    String? status,
    String? url,
    String? G__typename,
  }) {
    return GStoredFileData(
      id: id ?? this.id,
      filename: filename ?? this.filename,
      status: status ?? this.status,
      url: url ?? this.url,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GStoredFileData &&
            id == other.id &&
            filename == other.filename &&
            status == other.status &&
            url == other.url &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, filename, status, url, G__typename);
  }

  @override
  String toString() {
    return 'GStoredFileData(id: $id, filename: $filename, status: $status, url: $url, G__typename: $G__typename)';
  }
}

abstract class GFileAttachment {
  int get order;
  bool get isCover;
  GStoredFile get file;
  String get G__typename;
}

class GFileAttachmentData implements GFileAttachment {
  const GFileAttachmentData({
    required this.order,
    required this.isCover,
    required this.file,
    this.G__typename = 'FileAttachmentType',
  });

  factory GFileAttachmentData.fromJson(Map<String, dynamic> json) {
    return GFileAttachmentData(
      order: (json['order'] as int),
      isCover: (json['isCover'] as bool),
      file: GStoredFileData.fromJson((json['file'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final int order;

  final bool isCover;

  final GStoredFileData file;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['order'] = this.order;
    _$result['isCover'] = this.isCover;
    _$result['file'] = this.file.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GFileAttachmentData copyWith({
    int? order,
    bool? isCover,
    GStoredFileData? file,
    String? G__typename,
  }) {
    return GFileAttachmentData(
      order: order ?? this.order,
      isCover: isCover ?? this.isCover,
      file: file ?? this.file,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFileAttachmentData &&
            order == other.order &&
            isCover == other.isCover &&
            file == other.file &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, order, isCover, file, G__typename);
  }

  @override
  String toString() {
    return 'GFileAttachmentData(order: $order, isCover: $isCover, file: $file, G__typename: $G__typename)';
  }
}

abstract class GUploadConfigFields {
  GStoredFile get file;
  String get uploadUrl;
  String get fileKey;
  String get contentType;
  String get G__typename;
}

class GUploadConfigFieldsData implements GUploadConfigFields {
  const GUploadConfigFieldsData({
    required this.file,
    required this.uploadUrl,
    required this.fileKey,
    required this.contentType,
    this.G__typename = 'UploadConfigType',
  });

  factory GUploadConfigFieldsData.fromJson(Map<String, dynamic> json) {
    return GUploadConfigFieldsData(
      file: GStoredFileData.fromJson((json['file'] as Map<String, dynamic>)),
      uploadUrl: (json['uploadUrl'] as String),
      fileKey: (json['fileKey'] as String),
      contentType: (json['contentType'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final GStoredFileData file;

  final String uploadUrl;

  final String fileKey;

  final String contentType;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['file'] = this.file.toJson();
    _$result['uploadUrl'] = this.uploadUrl;
    _$result['fileKey'] = this.fileKey;
    _$result['contentType'] = this.contentType;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUploadConfigFieldsData copyWith({
    GStoredFileData? file,
    String? uploadUrl,
    String? fileKey,
    String? contentType,
    String? G__typename,
  }) {
    return GUploadConfigFieldsData(
      file: file ?? this.file,
      uploadUrl: uploadUrl ?? this.uploadUrl,
      fileKey: fileKey ?? this.fileKey,
      contentType: contentType ?? this.contentType,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUploadConfigFieldsData &&
            file == other.file &&
            uploadUrl == other.uploadUrl &&
            fileKey == other.fileKey &&
            contentType == other.contentType &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, file, uploadUrl, fileKey, contentType, G__typename);
  }

  @override
  String toString() {
    return 'GUploadConfigFieldsData(file: $file, uploadUrl: $uploadUrl, fileKey: $fileKey, contentType: $contentType, G__typename: $G__typename)';
  }
}
