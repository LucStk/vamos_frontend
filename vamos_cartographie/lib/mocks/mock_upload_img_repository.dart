import 'dart:io';
import 'package:vamos_cartographie/repository/upload_img_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'dart:math';

class MockUploadImgRepository implements UploadImgRepository {
  @override
  Future<Either<Failure, String>> uploadImage(
    File imageFile,
    String type, {
    Function(int sent, int total)? onProgress,
  }) async {
    // 1. Simuler un temps de latence (réseau)
    final int totalSize = 1000;

    // 2. Simuler une barre de progression qui monte
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(milliseconds: 500));
      if (onProgress != null) {
        onProgress(i * 200, totalSize); // 20%, 40%, 60%...
      }
    }
    var seed = (Random().nextInt(1000).toString());

    // 3. Retourner une fausse adresse d'image
    // On retourne le "fileKey" et l'URL d'accès immédiat à l'image
    var fileKey = "$seed/600/400";
    return Right(fileKey);
  }
}
