import 'dart:io';
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/media/data/repositories/upload_img_repository.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';

class MockUploadImgRepository implements UploadImgRepository {
  @override
  Future<Either<Failure, MediaImage>> uploadImage(
    File imageFile,
    String type, {
    Function(int sent, int total)? onProgress,
  }) async {
    const totalSize = 1000;
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      onProgress?.call(i * 200, totalSize);
    }
    final seed = Random().nextInt(1000).toString();
    final fileKey = '$seed/600/400';
    return Right(
      MediaImage(fileKey: fileKey, url: "https://picsum.photos/seed/$fileKey"),
    );
  }
}
