import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/foundation.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_link/gql_link.dart';
import 'package:vamos_cartographie/core/errors/exceptions_mappers/graphql_error_mapper.dart';
import 'package:vamos_cartographie/core/errors/exceptions_mappers/link_exceptions_mappers.dart';
import 'package:vamos_cartographie/core/errors/exceptions_mappers/dio_exceptions_mappers.dart';
import 'package:vamos_cartographie/core/errors/exceptions_mappers/session_exceptions_mappers.dart';
import 'package:vamos_cartographie/core/errors/server_failures.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/core/network/network.dart';

class ExceptionMapper {
  static Failure fromException(
    Object error, {
    StackTrace? stackTrace,
    GraphQLErrorsMapper? graphqlMapper,
  }) {
    return switch (error) {
      // --- Ferry / GraphQL ---
      GraphQLRequestException e => fromResponse(
        linkException: e.linkException,
        graphqlErrors: e.graphqlErrors,
        graphqlMapper: graphqlMapper,
      ),

      LinkException e => linkExceptionsMappers(e),

      // --- Dio ---
      DioException e => dioExceptionsMappers(e),

      // --- Bugs de code ---
      TypeError e => _unexpected(e, stackTrace),
      Error e => _unexpected(e, stackTrace),

      // --- Exceptions Dart génériques ---
      Exception e => ServerFailure(e.toString()),

      _ => _unexpected(error, stackTrace),
    };
  }

  static Failure fromResponse({
    LinkException? linkException,
    List<GraphQLError> graphqlErrors = const [],
    GraphQLErrorsMapper? graphqlMapper,
  }) {
    // Le transport reste prioritaire.
    if (linkException != null) {
      return linkExceptionsMappers(linkException);
    }

    if (graphqlErrors.isNotEmpty) {
      return sessionExceptionsMappers(graphqlErrors) ??
          graphqlMapper?.call(graphqlErrors) ??
          graphqlExceptionsMappers(graphqlErrors);
    }
    return UnexpectedFailure();
  }

  static Failure _unexpected(Object error, StackTrace? stackTrace) {
    final info = '${error.runtimeType}: $error';

    if (kDebugMode) {
      debugPrint('🐛 BUG NON GÉRÉ ── $info');

      if (stackTrace != null) {
        debugPrintStack(stackTrace: stackTrace, label: '🐛 Stacktrace');
      }
    }

    return UnexpectedFailure(message: info);
  }
}
