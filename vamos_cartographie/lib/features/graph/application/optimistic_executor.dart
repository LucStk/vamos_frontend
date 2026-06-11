import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import "package:vamos_cartographie/features/graph/domain/optimistic_spec.dart";

class OptimisticExecutor {
  Future<T> run<T>({
    required Future<T> Function() remote,
    required void Function() onApply,
    required void Function(T result) onSuccess,
    required void Function() onError,
  }) async {
    onApply();

    try {
      final result = await remote();
      onSuccess(result);
      return result;
    } catch (e) {
      onError();
      rethrow;
    }
  }
}
