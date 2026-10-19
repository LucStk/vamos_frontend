import 'package:domain_core/domain_core.dart';

// ─── Connexion / inscription : réaction locale au formulaire ───
sealed class SignInFailure extends Failure {
  SignInFailure(super.message, {super.timestamp});
}

final class InvalidCredentials extends SignInFailure {
  InvalidCredentials({super.timestamp})
    : super('Adresse e-mail ou mot de passe incorrect.');
}

final class EmailNotConfirmed extends SignInFailure {
  EmailNotConfirmed({super.timestamp})
    : super('Veuillez confirmer votre adresse e-mail avant de vous connecter.');
}

final class EmailAlreadyRegistered extends SignInFailure {
  EmailAlreadyRegistered({super.timestamp})
    : super('Un compte existe déjà avec cette adresse e-mail.');
}

final class WeakPassword extends SignInFailure {
  WeakPassword({super.timestamp}) : super('Ce mot de passe est trop faible.');
}

final class AuthRateLimited extends SignInFailure {
  AuthRateLimited({super.timestamp})
    : super('Trop de tentatives. Réessayez dans quelques instants.');
}

final class AuthResponseParseFailed extends SignInFailure {
  AuthResponseParseFailed({super.timestamp})
    : super('Impossible de traiter la réponse d’authentification.');
}

final class AuthUnknownFailure extends SignInFailure {
  AuthUnknownFailure({String? message, super.timestamp})
    : super(message ?? 'Une erreur d’authentification est survenue.');
}
