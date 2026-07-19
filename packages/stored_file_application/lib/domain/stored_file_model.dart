import 'dart:io';

import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "stored_file_model.freezed.dart";

enum UploadStatus { idle, uploading, success, failure }

sealed class StoredFileFields implements HasId {
  @override
  Id<StoredFileFields> get id;
  bool get hasError;
  bool get isUploading;
}

typedef StoredFileId = Id<StoredFileFields>;

@freezed
abstract class StoredFileRemoteModel
    with _$StoredFileRemoteModel
    implements StoredFileFields {
  const factory StoredFileRemoteModel({
    required StoredFileId id,
    required String filename,
    required String url,
  }) = _StoredFileRemoteModel;

  const StoredFileRemoteModel._();

  @override
  bool get hasError => false;
  @override
  bool get isUploading => false;
}

@freezed
abstract class StoredFilePatchModel
    with _$StoredFilePatchModel
    implements Patch<StoredFileRemoteModel>, StoredFileFields {
  @Implements<Patch<StoredFileRemoteModel>>()
  const factory StoredFilePatchModel.internal({
    required StoredFileId id,
    required File file,
    required bool recomputing,
    @Default(UploadStatus.idle) UploadStatus status,
    @Default(0) int sent,
    @Default(0) int total,
    String? error,
  }) = _StoredFilePatchModel;

  const StoredFilePatchModel._();

  @override
  bool get hasError => status == UploadStatus.failure;
  @override
  bool get isUploading => status == UploadStatus.uploading;

  factory StoredFilePatchModel({
    StoredFileId? id,
    required File file,
    bool recomputing = false,
    Object? error,
  }) {
    return StoredFilePatchModel.internal(
      id: id ?? StoredFileId.generate(),
      file: file,
      recomputing: recomputing,
    );
  }
}
