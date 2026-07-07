import 'package:equatable/equatable.dart';

// domain_core/lib/failure.dart
sealed class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

final class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(super.message, {this.statusCode});

  @override
  List<Object?> get props => [...super.props, statusCode];
}

final class ConnectionFailure extends Failure {
  const ConnectionFailure({String? message}) : super("Erreur réseau $message");
}

final class NotFoundFailure extends Failure {
  final String? resourceType;
  final String? resourceId;
  const NotFoundFailure({this.resourceType, this.resourceId})
    : super("Ressource introuvable");

  @override
  List<Object?> get props => [...super.props, resourceType, resourceId];
  // Optionnel : une méthode pour faciliter le debug/log
  @override
  String toString() => 'NotFoundFailure($resourceType #$resourceId): $message';
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure() : super("Erreur inattendue");
}
