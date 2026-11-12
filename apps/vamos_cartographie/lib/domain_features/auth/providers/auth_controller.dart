import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_providers.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncLoading();

    try {
      final result = await ref
          .read(authRepositoryProvider)
          .signInWithPassword(email: email, password: password);
      if (!ref.mounted) return;

      result.fold(
        (failure) => state = AsyncError(failure, StackTrace.current),
        (_) => state = const AsyncData(null),
      );
    } catch (error, stackTrace) {
      if (ref.mounted) state = AsyncError(error, stackTrace);
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    state = const AsyncLoading();

    try {
      final result = await ref
          .read(authRepositoryProvider)
          .signUp(email: email, password: password);
      if (!ref.mounted) return;

      result.fold(
        (failure) => state = AsyncError(failure, StackTrace.current),
        (_) => state = const AsyncData(null),
      );
    } catch (error, stackTrace) {
      if (ref.mounted) state = AsyncError(error, stackTrace);
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();

    try {
      final result = await ref.read(authRepositoryProvider).signOut();
      if (!ref.mounted) return;

      result.fold(
        (failure) => state = AsyncError(failure, StackTrace.current),
        (_) => state = const AsyncData(null),
      );
    } catch (error, stackTrace) {
      if (ref.mounted) state = AsyncError(error, stackTrace);
    }
  }
}
