import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/foundation.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_link/gql_link.dart';

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

      LinkException e => _fromLinkException(e),

      // --- Dio ---
      DioException e => _fromDioException(e),

      // --- Bugs de code ---
      TypeError e => _unexpected(e, stackTrace),
      Error e => _unexpected(e, stackTrace),

      // --- Exceptions Dart génériques ---
      Exception e => ServerFailure(e.toString()),

      _ => _unexpected(error, stackTrace),
    };
  }

  static Failure _fromLinkException(LinkException error) {
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

  static Failure _fromDioException(DioException e) {
    return switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.connectionError ||
      DioExceptionType.transformTimeout => ConnectionFailure(
        message: e.message,
      ),

      DioExceptionType.badResponse => _fromDioResponse(e),

      DioExceptionType.cancel => const ServerFailure('Requête annulée'),

      DioExceptionType.unknown ||
      DioExceptionType.badCertificate => const ConnectionFailure(),
    };
  }

  static Failure _fromDioResponse(DioException e) {
    final code = e.response?.statusCode;

    if (code == 404) {
      return const NotFoundFailure();
    }

    return ServerFailure(
      e.response?.statusMessage ?? 'Erreur serveur',
      statusCode: code,
    );
  }

  static Failure fromResponse({
    LinkException? linkException,
    List<GraphQLError> graphqlErrors = const [],
  }) {
    // Erreur au niveau HTTP / transport.
    if (linkException != null) {
      return _fromLinkException(linkException);
    }

    // Erreur GraphQL.
    if (graphqlErrors.isNotEmpty) {
      return _fromGraphQLErrors(graphqlErrors);
    }

    return const UnexpectedFailure();
  }

  static Failure _fromGraphQLErrors(List<GraphQLError> errors) {
    final error = errors.first;
    final code = error.extensions?['code'];

    return switch (code) {
      'AUTHENTICATION_REQUIRED' ||
      'INVALID_TOKEN' ||
      'TOKEN_EXPIRED' => AuthenticationFailure(message: error.message),

      'NOT_FOUND' => const NotFoundFailure(),

      _ => ServerFailure(error.message),
    };
  }

  static Failure _unexpected(Object error, StackTrace? stackTrace) {
    final info = '${error.runtimeType}: $error';

    if (kDebugMode) {
      debugPrint('🐛 BUG NON GÉRÉ ── $info');

      if (stackTrace != null) {
        debugPrintStack(stackTrace: stackTrace, label: '🐛 Stacktrace');
      }
    }

    return UnexpectedFailure(debugInfo: info);
  }
}
