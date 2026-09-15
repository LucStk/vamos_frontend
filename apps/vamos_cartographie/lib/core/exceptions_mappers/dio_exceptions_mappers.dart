import 'package:dio/dio.dart';
import 'package:domain_core/failures/failures.dart';

Failure dioExceptionsMappers(DioException e) {
  return switch (e.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.connectionError ||
    DioExceptionType.transformTimeout => ConnectionFailure(message: e.message),

    DioExceptionType.badResponse => _fromDioResponse(e),

    DioExceptionType.cancel => const ServerFailure('Requête annulée'),

    DioExceptionType.unknown ||
    DioExceptionType.badCertificate => const ConnectionFailure(),
  };
}

Failure _fromDioResponse(DioException e) {
  final code = e.response?.statusCode;

  if (code == 404) {
    return const NotFoundFailure();
  }

  return ServerFailure(
    e.response?.statusMessage ?? 'Erreur serveur',
    statusCode: code,
  );
}
