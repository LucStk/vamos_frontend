import 'package:domain_core/failures.dart';

// ─── Session : n'importe quelle requête, réaction globale ───
sealed class SessionFailure extends Failure {
  SessionFailure(super.message, {super.timestamp});
}

final class NotAuthFailure extends SessionFailure {
  NotAuthFailure({String? message, super.timestamp})
    : super(message ?? 'Authentification requise');
}

final class RessourceNeedAuth extends SessionFailure {
  RessourceNeedAuth({String? message, super.timestamp})
    : super(message ?? 'Authentification requise');
}
