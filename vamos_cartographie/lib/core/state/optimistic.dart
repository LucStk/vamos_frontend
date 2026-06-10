import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/failure.dart';

class OptimisticSpec<T> {
  final void Function() apply;
  final void Function() rollback;
  final void Function(T result)? reconcile;

  OptimisticSpec({required this.apply, required this.rollback, this.reconcile});
}

@riverpod
class OptimisticExecutor {
  int _tx = 0; //TODO : Tx par key

  Future<T> run<T>({
    required Future<Either<Failure, T>> Function() remote,
    required OptimisticSpec spec,
  }) async {
    final tx = ++_tx;

    spec.apply();

    final result = await remote();

    // ignore stale response
    if (tx != _tx) {
      return result.getOrElse(() => throw Exception("stale"));
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
