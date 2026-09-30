import 'package:dartz/dartz.dart';
import 'package:domain_core/failures/failures.dart';

import 'auth_repository.dart';
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
  Future<Either<Failure, User>> signInWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) {
        return left(AuthResponseParseFailed());
      }

      return right(user);
    } on AuthException catch (e) {
      return left(_mapAuthException(e));
    } catch (_) {
      return left(AuthUnknownFailure());
    }
  }

  AuthFailure _mapAuthException(AuthException error) {
    return switch (error.code) {
      'invalid_credentials' => InvalidCredentials(),
      'email_not_confirmed' => EmailNotConfirmed(),
      _ => AuthUnknownFailure(),
    };
  }

  @override
  Future<Either<Failure, void>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _client.auth.signUp(email: email, password: password);

      return right(null);
    } on AuthException catch (e) {
      return left(_mapAuthException(e));
    } catch (_) {
      return left(AuthUnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _client.auth.signOut();

      return right(null);
    } on AuthException catch (e) {
      return left(_mapAuthException(e));
    } catch (_) {
      return left(AuthUnknownFailure());
    }
  }
}
