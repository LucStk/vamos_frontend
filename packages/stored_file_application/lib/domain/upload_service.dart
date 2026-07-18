import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:domain_core/notification/failure.dart';
import 'package:stored_file_application/domain/upload_config_model.dart';

abstract class UploadService {
  Future<Either<Failure, UploadConfigModel>> requestSignedUrl(File file);

  Future<Either<Failure, void>> putFile(
    File file,
    UploadConfigModel config, {
    void Function(int sent, int total)? onProgress,
    CancelToken? cancelToken,
  });
}
