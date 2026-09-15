import 'package:domain_core/failures/failures.dart';
import 'package:gql_link/gql_link.dart';

Failure linkExceptionsMappers(LinkException error) {
  return switch (error) {
    ServerException(:final statusCode) => ServerFailure(
      'Erreur serveur',
      statusCode: statusCode,
    ),

    ResponseFormatException(:final originalException) =>
      InvalidServerResponseFailure(
        message: 'Réponse invalide du serveur: $originalException',
      ),

    _ => const ConnectionFailure(),
  };
}
