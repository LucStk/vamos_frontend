// attachable_media_repository.dart
import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';

abstract interface class AttachableMediaRepository<E> {
  Future<Either<Failure, MediaImage>> attachImage(Id<E> id, FileKey key);
  Future<Either<Failure, void>> detachImage(Id<E> id, FileKey key);
}
