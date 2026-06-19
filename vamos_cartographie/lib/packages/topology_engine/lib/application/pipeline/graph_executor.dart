import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';

class OptimisticExecutor {
  Future<void> run<T>({
    required Future<Either<Failure, T>> Function() remote,
    required void Function() onApply,
    required void Function(T result) onSuccess,
    required void Function() onError,
  }) async {
    onApply();

    final result = await remote();
    result.fold(
      (failure) {
        onError();
      },
      (data) {
        onSuccess(data);
      },
    );
  }
}
