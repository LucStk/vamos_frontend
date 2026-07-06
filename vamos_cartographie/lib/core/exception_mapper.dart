// lib/infrastructure/core/exception_mapper.dart
import 'package:ferry/ferry.dart';
import 'package:domain_core/failure.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_link/gql_link.dart';

class ExceptionMapper {
  static Failure fromException(Object error, StackTrace? stackTrace) {
    return switch (error) {
      // Erreurs réseau / transport
      LinkException _ => const ConnectionFailure(),

      // Erreurs GraphQL
      GraphQLError gqlError when _isNotFound(gqlError) =>
        const NotFoundFailure(),

      GraphQLError gqlError => ServerFailure(
        gqlError.message.isNotEmpty ? gqlError.message : 'Erreur serveur',
      ),

      // Exceptions Dart génériques
      Exception ex => ServerFailure(ex.toString()),

      _ => const UnexpectedFailure(),
    };
  }

  static bool _isNotFound(GraphQLError error) {
    return error.extensions?['code'] == 'NOT_FOUND';
  }

  static Failure fromResponse({
    LinkException? linkException,
    List<GraphQLError> graphqlErrors = const [],
  }) {
    if (linkException != null) {
      return const ConnectionFailure();
    }

    if (graphqlErrors.any((e) => e.extensions?['code'] == 'NOT_FOUND')) {
      return const NotFoundFailure();
    }

    if (graphqlErrors.isNotEmpty) {
      return ServerFailure(graphqlErrors.first.message);
    }

    return const UnexpectedFailure();
  }
}
