part of 'failures.dart';

sealed class AuthFailure extends Failure {
  AuthFailure(super.message, {super.timestamp});
}

final class NotAuthFailure extends AuthFailure {
  NotAuthFailure({String? message, super.timestamp})
    : super(message ?? 'Authentification requise');
}

final class RessourceNeedAuth extends AuthFailure {
  RessourceNeedAuth({String? message, super.timestamp})
    : super(message ?? 'Authentification requise');
}

final class InvalidCredentials extends AuthFailure {
  InvalidCredentials({super.timestamp})
    : super('Adresse e-mail ou mot de passe incorrect.');
}

final class EmailNotConfirmed extends AuthFailure {
  EmailNotConfirmed({super.timestamp})
    : super('Veuillez confirmer votre adresse e-mail avant de vous connecter.');
}

final class AuthResponseParseFailed extends AuthFailure {
  AuthResponseParseFailed({super.timestamp})
    : super('Impossible de traiter la réponse d’authentification.');
}

final class AuthUnknownFailure extends AuthFailure {
  AuthUnknownFailure({String? message, super.timestamp})
    : super(message ?? 'Une erreur d’authentification est survenue.');
}
