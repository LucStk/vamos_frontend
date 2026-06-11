import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import "package:vamos_cartographie/features/graph/domain/optimistic_spec.dart";

class OptimisticExecutor {
  Future<T> run<T>({
    required Future<Either<Failure, T>> Function() remote,
    required OptimisticSpec<T> spec,
  }) async {
    spec.apply();

    final result = await remote();

    if (spec.isStillValid != null && !spec.isStillValid!()) {
      return result.getOrElse(() => throw StateError('stale response'));
    }

    return result.fold(
      (failure) {
        spec.rollback();
        throw failure;
      },
      (data) {
        spec.reconcile?.call(data);
        return data;
      },
    );
  }
}
