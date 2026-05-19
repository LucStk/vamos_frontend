// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
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

class GAttachImageToTripVars {
  const GAttachImageToTripVars({
    required this.tripId,
    required this.fileKey,
  });

  factory GAttachImageToTripVars.fromJson(Map<String, dynamic> json) {
    return GAttachImageToTripVars(
      tripId: (json['tripId'] as int),
      fileKey: (json['fileKey'] as String),
    );
  }

  final int tripId;

  final String fileKey;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$fileKeyValue = this.fileKey;
    _$result['fileKey'] = _$fileKeyValue;
    return _$result;
  }

  GAttachImageToTripVars copyWith({
    int? tripId,
    String? fileKey,
  }) {
    return GAttachImageToTripVars(
      tripId: tripId ?? this.tripId,
      fileKey: fileKey ?? this.fileKey,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachImageToTripVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GAttachImageToTripVars(tripId: $tripId, fileKey: $fileKey)';
  }
}
