import 'package:dartz/dartz.dart';
import 'package:domain_core/notification/notification.dart';

mixin OptimisticRunner<S> {
  S get state;
  set state(S value);
  ErrorLogger? get errorLogger => null;

  Future<Either<Failure, T>> run<T>({
    required Future<Either<Failure, T>> Function(
      void Function(S Function(S state) update) reportProgress,
    )
    remote,
    required S? Function(S state) onApply,
    S? Function(S state, T result)? onSuccess,
    S? Function(S state, Failure failure)? onError,
  }) async {
    final applied = onApply(state);
    if (applied != null) state = applied;

    void reportProgress(S Function(S state) update) {
      final next = update(state);
      state = next;
    }

    final result = await remote(reportProgress);

    result.fold(
      (Failure f) {
        errorLogger?.logError(f, StackTrace.current);
        final next = onError?.call(state, f);
        if (next != null) state = next;
      },
      (T value) {
        final next = onSuccess?.call(state, value);
        if (next != null) state = next;
      },
    );
    return result;
  }
}
