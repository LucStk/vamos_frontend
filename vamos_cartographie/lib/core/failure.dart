import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure() : super("Erreur réseau");
}

// Ressource introuvable (404)
class NotFoundFailure extends Failure {
  const NotFoundFailure() : super("Le voyage demandé n'existe pas.");
}

// Erreur de cache (si tu utilises une DB locale plus tard)
class CacheFailure extends Failure {
  const CacheFailure() : super("Erreur de lecture des données locales.");
}
