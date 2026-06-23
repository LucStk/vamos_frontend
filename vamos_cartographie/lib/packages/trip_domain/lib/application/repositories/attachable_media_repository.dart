// attachable_media_repository.dart
import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';

abstract interface class AttachableMediaRepository {
  Future<Either<Failure, MediaImage>> attachImage(Id id, FileKey key);
}
