import "package:dartz/dartz.dart";
import "package:domain_core/failures/failures.dart";
import "package:supabase_flutter/supabase_flutter.dart";

abstract interface class AuthRepository {
  User? get currentUser;

  String? get accessToken;

  Stream<User?> get authStateChanges;

  Future<Either<Failure, User>> signInWithPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signUp({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signOut();
}
