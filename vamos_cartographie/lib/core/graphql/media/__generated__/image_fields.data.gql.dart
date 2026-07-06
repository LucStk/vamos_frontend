// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

abstract class GImageFields {
  String get url;
  String get fileKey;
  String get G__typename;
}

class GImageFieldsData implements GImageFields {
  const GImageFieldsData({
    required this.url,
    required this.fileKey,
    this.G__typename = 'MediaImageType',
  });

  factory GImageFieldsData.fromJson(Map<String, dynamic> json) {
    return GImageFieldsData(
      url: (json['url'] as String),
      fileKey: (json['fileKey'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String url;

  final String fileKey;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['url'] = this.url;
    _$result['fileKey'] = this.fileKey;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GImageFieldsData copyWith({
    String? url,
    String? fileKey,
    String? G__typename,
  }) {
    return GImageFieldsData(
      url: url ?? this.url,
      fileKey: fileKey ?? this.fileKey,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GImageFieldsData &&
            url == other.url &&
            fileKey == other.fileKey &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, url, fileKey, G__typename);
  }

  @override
  String toString() {
    return 'GImageFieldsData(url: $url, fileKey: $fileKey, G__typename: $G__typename)';
  }
}
