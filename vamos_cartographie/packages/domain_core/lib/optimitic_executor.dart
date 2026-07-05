import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';

class OptimisticExecutor {
  ErrorLogger? errorLogger;
  OptimisticExecutor(this.errorLogger);

  Future<Either<Failure, T>> run<T>({
    required Future<Either<Failure, T>> Function() remote,
    required void Function() onApply,
    required void Function(T result) onSuccess,
    required void Function(Failure failure) onError,
  }) async {
    onApply();

    final result = await remote();

    result.fold((Failure f) {
      errorLogger?.logError(f, StackTrace.current);
      onError(f);
    }, onSuccess);

    return result;
  }
}
