import 'package:dartz/dartz.dart';
import 'package:media_application/media_application.dart';

import 'package:domain_core/domain_core.dart';
import 'dart:io';

abstract class MediaRepository {
  Future<Either<Failure, MediaImage>> uploadImage(
    File file,
    Function(int sent, int total)? onProgress,
  );
  Future<Either<Failure, MediaImage>> attachImage<T>(
    Id<T> id,
    FileKey filekey,
    MediaOwnerType ownerType,
  );
  Future<Either<Failure, void>> detachImage<T>(
    Id<T> id,
    FileKey filekey,
    MediaOwnerType ownerType,
  );
}
