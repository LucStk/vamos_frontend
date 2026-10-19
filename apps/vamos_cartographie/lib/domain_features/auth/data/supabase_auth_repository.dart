import 'package:dartz/dartz.dart';

import 'package:domain_core/domain_core.dart';
import "package:supabase_flutter/supabase_flutter.dart";
import 'package:vamos_cartographie/domain_features/auth/data/auth_repository.dart';
import 'package:vamos_cartographie/domain_features/auth/data/sign_in_exceptions_mappers.dart';
import 'package:vamos_cartographie/domain_features/auth/data/sign_in_failures.dart';

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

  Future<Either<Failure, T>> _run<T>(Future<T> Function() action) async {
    try {
      return right(await action());
    } on AuthException catch (e) {
      return left(signInExceptionsMapper(e));
    } catch (_) {
      return left(AuthUnknownFailure());
    }
  }

  @override
  Future<Either<Failure, User>> signInWithPassword({
    required String email,
    required String password,
  }) async {
    final result = await _run(
      () => _client.auth.signInWithPassword(email: email, password: password),
    );

    return result.flatMap(
      (response) => response.user == null
          ? left(AuthResponseParseFailed())
          : right(response.user!),
    );
  }

  @override
  Future<Either<Failure, void>> signUp({
    required String email,
    required String password,
  }) => _run(() => _client.auth.signUp(email: email, password: password));

  @override
  Future<Either<Failure, void>> signOut() => _run(_client.auth.signOut);
}
