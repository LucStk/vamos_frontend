import 'package:domain_core/domain_core.dart';
import 'package:gql_link/gql_link.dart';
import 'package:vamos_cartographie/core/errors/server_failures.dart';

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

    _ => ConnectionFailure(),
  };
}
