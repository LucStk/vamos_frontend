import "package:supabase_flutter/supabase_flutter.dart";

abstract interface class AuthRepository {
  User? get currentUser;

  String? get accessToken;

  Stream<User?> get authStateChanges;

  Future<User> signIn({required String email, required String password});

  Future<User?> signUp({required String email, required String password});

  Future<void> signOut();
}
