import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import 'package:domain_core/id.dart';
import 'package:domain_core/media.dart';
import 'package:trip_domain/domain/domain.dart';

import 'dart:io';

abstract class MediaRepository {
  Future<Either<Failure, MediaImage>> uploadImage(
    File file,
    Function(int sent, int total)? onProgress,
  );
  Future<Either<Failure, MediaImage>> attachImage<T>(Id<T> id, FileKey filekey);
  Future<Either<Failure, void>> detachImage<T>(Id<T> id, FileKey filekey);
}
