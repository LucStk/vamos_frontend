import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import 'package:domain_core/id.dart';
import 'package:media_application/domain/entities/media_image.dart';
import 'package:media_application/domain/value_objects/media_owner_ext.dart';
import 'package:media_application/media_application.dart';

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
