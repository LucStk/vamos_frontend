import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/core/errors/session_failures.dart';
import 'package:gql_exec/gql_exec.dart';

typedef _SessionFactory = SessionFailure Function(String message);

final Map<String, _SessionFactory> _sessionFailureByCode = {
  'AUTHENTICATION_REQUIRED': (m) => RessourceNeedAuth(message: m),
  'INVALID_TOKEN': (m) => RessourceNeedAuth(message: m),
  'TOKEN_EXPIRED': (m) => RessourceNeedAuth(message: m),
  // Pour enrichir : ajoute une ligne ici (et la classe SessionFailure associée).
};

/// Renvoie une SessionFailure si une des erreurs en est une, sinon `null`.
Failure? sessionExceptionsMappers(List<GraphQLError> errors) {
  for (final error in errors) {
    final code = error.extensions?['code'];
    final factory = code is String ? _sessionFailureByCode[code] : null;
    if (factory != null) return factory(error.message);
  }
  return null;
}
