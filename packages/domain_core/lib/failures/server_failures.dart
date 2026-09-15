part of 'failures.dart';

final class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(super.message, {this.statusCode});

  @override
  List<Object?> get props => [...super.props, statusCode];
}

final class ConnectionFailure extends Failure {
  const ConnectionFailure({String? message}) : super("Erreur réseau $message");
}

final class InvalidServerResponseFailure extends Failure {
  const InvalidServerResponseFailure({String? message})
    : super('Réponse invalide du serveur.');
}
