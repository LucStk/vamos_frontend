// lib/infrastructure/core/base_repository.dart
import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import "exception_mapper.dart";

abstract class BaseRepository {
  Future<Either<Failure, T>> tryRemote<T>(Future<T> Function() call) async {
    try {
      return Right(await call());
    } catch (e, st) {
      return Left(ExceptionMapper.fromException(e, st));
    }
  }
}
