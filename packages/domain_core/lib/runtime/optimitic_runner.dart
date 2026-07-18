import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';

mixin OptimisticRunner<S> {
  S get state;
  set state(S value);
  ErrorLogger? get errorLogger => null;
  MutationQueue get mutationQueue; // à injecter, comme tripRepo/storedFileRepo

  Future<Either<Failure, T>> run<T, K>({
    K? entityKey, // null => pas de sérialisation (ex: createBlankTrip)
    required Future<Either<Failure, T>> Function(
      void Function(S Function(S state) update) reportProgress,
    )
    remote,
    required S? Function(S state) onApply,
    S? Function(S state, T result)? onSuccess,
    S? Function(S state, Failure failure)? onError,
  }) {
    Future<Either<Failure, T>> operation() async {
      final applied = onApply(state);
      if (applied != null) state = applied;

      void reportProgress(S Function(S state) update) {
        state = update(state);
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

    if (entityKey == null) return operation();
    return mutationQueue.enqueue(entityKey, operation);
  }
}
