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
  const ConnectionFailure() : super("Erreur réseau");
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure() : super("Ressource introuvable");
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure() : super("Erreur inattendue");
}
