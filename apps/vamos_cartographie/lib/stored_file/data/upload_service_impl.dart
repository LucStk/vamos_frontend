import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:domain_core/notification/failure.dart';
import 'package:stored_file_application/stored_file_application.dart';

import 'package:mime/mime.dart'; // Packge utile pour le mimeType
import 'package:path/path.dart' as p;
import 'package:vamos_cartographie/core/services/exception_mapper.dart';

class UploadServiceImpl implements UploadService {
  final StoredFileRepository storedFileRepo;

  final Dio dio;

  UploadServiceImpl({required this.storedFileRepo, required this.dio});

  @override
  Future<Either<Failure, UploadConfigModel>> requestSignedUrl(File file) async {
    final size = await file.length();
    final fileName = p.basename(file.path);
    final mimeType = lookupMimeType(file.path) ?? 'application/octet-stream';
    return storedFileRepo.getSignedURL(fileName, mimeType, size);
  }

  @override
  Future<Failure?> putFile(
    File file,
    UploadConfigModel config, {
    void Function(int sent, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final size = await file.length();
    try {
      final response = await dio.put(
        config.uploadUrl,
        data: file.openRead(),
        options: Options(
          headers: {'Content-Type': config.contentType, 'Content-Length': size},
        ),
        cancelToken: cancelToken,
        onSendProgress: onProgress,
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        return ServerFailure(
          'Échec de l\'upload vers SeaweedFS : ${response.statusMessage}',
        );
      }
    } catch (e) {
      return ExceptionMapper.fromException(e);
    }

    return null;
  }
}
