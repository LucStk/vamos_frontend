import 'package:auth/auth_repository.dart';
import "package:supabase_flutter/supabase_flutter.dart";

final class SupabaseAuthRepository implements AuthRepository {
  const SupabaseAuthRepository(this._client);

  final SupabaseClient _client;

  @override
  User? get currentUser => _client.auth.currentUser;

  @override
  String? get accessToken => _client.auth.currentSession?.accessToken;

  @override
  Stream<User?> get authStateChanges async* {
    yield currentUser;

    await for (final event in _client.auth.onAuthStateChange) {
      yield event.session?.user;
    }
  }

  @override
  Future<User> signIn({required String email, required String password}) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final user = response.user;

    if (user == null) {
      throw StateError('No user returned by Supabase.');
    }

    return user;
  }

  @override
  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
    );

    return response.user;
  }

  @override
  Future<void> signOut() {
    return _client.auth.signOut();
  }
}
