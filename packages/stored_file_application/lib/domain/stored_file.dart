import 'dart:io';

import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "stored_file.freezed.dart";

enum UploadStatus { idle, uploading, success, failure }

@freezed
abstract class StoredFile with _$StoredFile implements Patchable<StoredFile> {
  const factory StoredFile({
    required Id<StoredFile> id,
    required String filename,
    required String url,
    required String status,
  }) = _StoredFile;

  const StoredFile._();
}

typedef StoredFileId = Id<StoredFile>;

@freezed
abstract class StoredFilePatch
    with _$StoredFilePatch
    implements Patch<StoredFile> {
  @Implements<Patch<StoredFile>>()
  const factory StoredFilePatch.internal({
    required Id<StoredFile> id,
    required File file,
    required bool recomputing,
    @Default(UploadStatus.idle) UploadStatus? status,
    @Default(0) int? sent,
    @Default(0) int? total,
    String? error,
  }) = _StoredFilePatch;

  const StoredFilePatch._();

  factory StoredFilePatch({
    required Id<StoredFile>? id,
    required File file,
    bool recomputing = false,
    Object? error,
  }) {
    return StoredFilePatch.internal(
      id: id ?? Id<StoredFile>.generate(),
      file: file,
      recomputing: recomputing,
    );
  }
}
