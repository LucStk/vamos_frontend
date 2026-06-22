import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import 'package:trip_domain/domain/domain.dart';

import 'dart:io';

abstract class MediaRepository {
  Future<Either<Failure, MediaImage>> uploadImage(
    File imageFile,
    String type,
    Function(int sent, int total)? onProgress,
  );
}
