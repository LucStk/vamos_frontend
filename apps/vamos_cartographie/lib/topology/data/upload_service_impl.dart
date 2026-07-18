import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:domain_core/notification/failure.dart';
import 'package:stored_file_application/domain/stored_file_repository.dart';
import 'package:stored_file_application/domain/upload_config_model.dart';

import 'package:mime/mime.dart'; // Packge utile pour le mimeType
import 'package:path/path.dart' as p;
import 'package:stored_file_application/domain/upload_service.dart'; // Package utile pour le nom du fichier

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
  Future<Either<Failure, void>> putFile(
    File file,
    UploadConfigModel config, {
    void Function(int sent, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final size = await file.length();
      final response = await dio.put(
        config.uploadUrl,
        data: file.openRead(),
        options: Options(
          headers: {'Content-Type': config.contentType, 'Content-Length': size},
        ),
        cancelToken: cancelToken,
        onSendProgress: onProgress,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(null);
      }
      return Left(ServerFailure('Échec de l\'upload vers SeaweedFS'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Erreur réseau'));
    }
  }
}
