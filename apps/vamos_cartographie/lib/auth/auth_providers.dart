import 'package:auth/auth.dart';
import 'package:auth/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return SupabaseAuthRepository(Supabase.instance.client);
}

@Riverpod(keepAlive: true)
Stream<AuthState> authState(Ref ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
}

@Riverpod(keepAlive: true)
User? currentUser(Ref ref) {
  final state = ref.watch(authStateProvider).valueOrNull;

  return switch (state) {
    AuthAuthenticated(:final user) => user,
    _ => null,
  };
}

@Riverpod(keepAlive: true)
String? accessToken(Ref ref) {
  final state = ref.watch(authStateProvider).valueOrNull;

  return switch (state) {
    AuthAuthenticated(:final accessToken) => accessToken,
    _ => null,
  };
}
