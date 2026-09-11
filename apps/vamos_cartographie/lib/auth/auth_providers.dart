import 'package:auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return SupabaseAuthRepository(Supabase.instance.client);
}

@Riverpod(keepAlive: true)
Stream<User?> authState(Ref ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
}

@Riverpod(keepAlive: true)
User? currentUser(Ref ref) {
  return ref.watch(authStateProvider).value;
}

@Riverpod(keepAlive: true)
String? accessToken(Ref ref) {
  return ref.watch(authRepositoryProvider).accessToken;
}
