import "/domain_features/auth/data/data.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_providers.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  late final AuthRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.watch(authRepositoryProvider);
  }

  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncLoading();

    try {
      final result = await _repository.signInWithPassword(
        email: email,
        password: password,
      );

      result.fold(
        (failure) {
          state = AsyncError(failure, StackTrace.current);
        },
        (_) {
          state = const AsyncData(null);
        },
      );
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    state = const AsyncLoading();

    try {
      final result = await _repository.signUp(email: email, password: password);

      result.fold(
        (failure) {
          state = AsyncError(failure, StackTrace.current);
        },
        (_) {
          state = const AsyncData(null);
        },
      );
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();

    try {
      final result = await _repository.signOut();
      if (!ref.mounted) return; // le notifier a pu être détruit entre-temps

      result.fold(
        (failure) {
          state = AsyncError(failure, StackTrace.current);
        },
        (_) {
          state = const AsyncData(null);
        },
      );
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}
