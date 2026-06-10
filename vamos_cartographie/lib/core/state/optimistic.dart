import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';

class OptimisticSpec<T> {
  final void Function() apply;
  final void Function() rollback;
  final void Function(T result)? reconcile;

  OptimisticSpec({required this.apply, required this.rollback, this.reconcile});
}

class OptimisticExecutor {
  Future<void> run({
    required OptimisticSpec spec,
    required Future<Either<Failure, dynamic>> Function() remote,
  }) async {
    final snapshot = DateTime.now().microsecondsSinceEpoch;

    spec.apply();

    final result = await remote();

    result.fold((_) => spec.rollback(), (data) => spec.reconcile(data));
  }
}
