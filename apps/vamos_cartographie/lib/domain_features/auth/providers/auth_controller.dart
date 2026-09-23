import "/auth/data/data.dart";
import 'package:flutter/rendering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_providers.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  late final AuthRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.watch(authRepositoryProvider);
  }

  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncLoading();

    try {
      await _repository.signIn(email: email, password: password);

      state = const AsyncData(null);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    state = const AsyncLoading();

    try {
      await _repository.signUp(email: email, password: password);

      state = const AsyncData(null);
    } catch (error, stackTrace) {
      debugPrint("sigup error $error");
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();

    try {
      await _repository.signOut();

      state = const AsyncData(null);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}
