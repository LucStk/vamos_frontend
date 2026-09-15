import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/stored_file_application.dart';

abstract interface class UploadService {
  Future<Either<Failure, UploadConfigModel>> requestSignedUrl(File file);

  Future<Failure?> putFile(
    File file,
    UploadConfigModel config, {
    void Function(int sent, int total)? onProgress,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, StoredFileId>> upload(
    File file, {
    void Function(int sent, int total)? onProgress,
    CancelToken? cancelToken,
  });
}
