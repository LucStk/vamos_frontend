// exceptions_mappers/sign_in_exceptions_mapper.dart
import 'package:supabase_flutter/supabase_flutter.dart'
    show AuthException, AuthWeakPasswordException;
import 'package:vamos_cartographie/domain_features/auth/data/sign_in_failures.dart';

SignInFailure signInExceptionsMapper(AuthException error) {
  if (error is AuthWeakPasswordException) return WeakPassword();

  return switch (error.code) {
    'invalid_credentials' => InvalidCredentials(),
    'email_not_confirmed' => EmailNotConfirmed(),
    'user_already_exists' || 'email_exists' => EmailAlreadyRegistered(),
    'weak_password' => WeakPassword(),
    'over_request_rate_limit' ||
    'over_email_send_rate_limit' => AuthRateLimited(),
    _ => AuthUnknownFailure(message: error.message),
  };
}
