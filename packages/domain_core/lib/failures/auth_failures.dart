part of 'failures.dart';

final class AuthenticationFailure extends Failure {
  AuthenticationFailure({String? message, super.timestamp})
    : super(message ?? 'Authentification requise');
}
