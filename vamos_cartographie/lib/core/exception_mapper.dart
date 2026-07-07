// lib/infrastructure/core/exception_mapper.dart
import 'package:ferry/ferry.dart';
import 'package:domain_core/failure.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_link/gql_link.dart';

import 'package:dio/dio.dart';
import 'package:gql_exec/gql_exec.dart' show GraphQLError;
import 'package:gql_link/gql_link.dart' show LinkException, ServerException;
import 'package:flutter/foundation.dart';
import 'network/graphql_request_exception.dart';

class ExceptionMapper {
  static Failure fromException(Object error, [StackTrace? stackTrace]) {
    return switch (error) {
      // --- Ferry / GraphQL ---
      GraphQLRequestException e => fromResponse(
        linkException: e.linkException,
        graphqlErrors: e.graphqlErrors,
      ),
      LinkException _ => const ConnectionFailure(),

      // --- Dio (upload d'images) ---
      DioException e => _fromDioException(e),

      // --- Bugs de code : ne jamais déguiser en erreur réseau ---
      TypeError e => _unexpected(e, stackTrace),
      Error e => _unexpected(e, stackTrace),

      // --- Exceptions Dart génériques restantes ---
      Exception ex => ServerFailure(ex.toString()),

      _ => _unexpected(error, stackTrace),
    };
  }

  static Failure _unexpected(Object error, StackTrace? stackTrace) {
    final info = '${error.runtimeType}: $error';
    if (kDebugMode) {
      debugPrint('🐛 BUG NON GÉRÉ ── $info');
      if (stackTrace != null) {
        debugPrintStack(stackTrace: stackTrace, label: '🐛 Stacktrace');
      }
    } else {
      // En prod : log silencieux vers un service de crash reporting
      // ex: Sentry.captureException(error, stackTrace: stackTrace);
    }
    return UnexpectedFailure(debugInfo: info);
  }

  static Failure _fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return ConnectionFailure(message: e.message);
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        if (code == 404) {
          return const NotFoundFailure();
        }
        return ServerFailure(
          e.response?.statusMessage ?? 'Erreur serveur',
          statusCode: code,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Requête annulée');
      case DioExceptionType.unknown:
      case DioExceptionType.badCertificate:
        return const ConnectionFailure();
    }
  }

  static bool _isNotFound(GraphQLError error) {
    return error.extensions?['code'] == 'NOT_FOUND';
  }

  static Failure fromResponse({
    LinkException? linkException,
    List<GraphQLError> graphqlErrors = const [],
  }) {
    if (linkException != null) {
      // ServerException = erreur HTTP côté link (ex: 500), pas juste "pas de réseau"
      if (linkException is ServerException) {
        return ServerFailure(
          'Erreur serveur',
          statusCode: linkException.statusCode,
        );
      }
      return const ConnectionFailure();
    }
    if (graphqlErrors.any(_isNotFound)) {
      return const NotFoundFailure();
    }
    if (graphqlErrors.isNotEmpty) {
      return ServerFailure(graphqlErrors.first.message);
    }
    return const UnexpectedFailure();
  }
}
