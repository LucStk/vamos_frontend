import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';

class OptimisticSpec<T> {
  final void Function() apply;
  final void Function() rollback;

  /// version locale au moment de l'envoi
  final int revision;

  /// vérifie si on peut appliquer la réponse
  final bool Function()? isStillValid;

  final void Function(T result)? reconcile;

  OptimisticSpec({
    required this.apply,
    required this.rollback,
    required this.revision,
    this.isStillValid,
    this.reconcile,
  });
}

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
