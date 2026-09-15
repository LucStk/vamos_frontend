import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/foundation.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_link/gql_link.dart';
import "dio_exceptions_mappers.dart";
import 'graphql_exceptions_mappers.dart';
import "link_exceptions_mappers.dart";

import 'package:domain_core/domain_core.dart';

import '../network/graphql_request_exception.dart';

class ExceptionMapper {
  static Failure fromException(Object error, [StackTrace? stackTrace]) {
    return switch (error) {
      // --- Ferry / GraphQL ---
      GraphQLRequestException e => fromResponse(
        linkException: e.linkException,
        graphqlErrors: e.graphqlErrors,
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
  }) {
    // Erreur au niveau HTTP / transport.
    if (linkException != null) {
      return linkExceptionsMappers(linkException);
    }

    // Erreur GraphQL.
    if (graphqlErrors.isNotEmpty) {
      return graphqlExceptionsMappers(graphqlErrors);
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
