import '/domain/value_objects/upload_status.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_state.freezed.dart';

@freezed
abstract class UploadState with _$UploadState {
  const factory UploadState({
    @Default(UploadStatus.idle) UploadStatus status,
    @Default(0) int sent,
    @Default(0) int total,
    String? error,
  }) = _UploadState;
}
