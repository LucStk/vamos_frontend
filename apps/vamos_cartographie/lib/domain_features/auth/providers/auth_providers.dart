import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/domain_features/auth/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return SupabaseAuthRepository(Supabase.instance.client);
}

@Riverpod(keepAlive: true)
Stream<User?> authState(Ref ref) {
  // Permet de réagir aux changements de session
  return ref.watch(authRepositoryProvider).authStateChanges;
}

@Riverpod(keepAlive: true)
String? currentUserId(Ref ref) =>
    ref.watch(authStateProvider.select((s) => s.value?.id));

// @Riverpod(keepAlive: true)
// User? currentUser(Ref ref) {
//   return ref.watch(authStateProvider).value;
// }

// @Riverpod(keepAlive: true)
// String? accessToken(Ref ref) {
//   return ref.watch(authRepositoryProvider).accessToken;
// }
