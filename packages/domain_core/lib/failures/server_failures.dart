part of 'failures.dart';

final class ServerFailure extends Failure {
  final int? statusCode;

  ServerFailure(super.message, {this.statusCode, super.timestamp});

  @override
  List<Object?> get props => [...super.props, statusCode];
}

final class ConnectionFailure extends Failure {
  ConnectionFailure({String? message, super.timestamp})
    : super(message != null ? 'Erreur réseau : $message' : 'Erreur réseau');
}

final class InvalidServerResponseFailure extends Failure {
  InvalidServerResponseFailure({String? message, super.timestamp})
    : super(message ?? 'Réponse invalide du serveur');
}
