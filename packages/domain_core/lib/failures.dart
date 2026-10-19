import 'package:equatable/equatable.dart';
import "package:intl/intl.dart";

abstract class Failure extends Equatable {
  final String message;
  final DateTime timestamp;

  Failure(this.message, {DateTime? timestamp})
    : timestamp = timestamp ?? DateTime.now();

  /// Renvoie l'heure formatée, ex: "14:30"
  String get formattedTime => DateFormat('HH:mm').format(timestamp);

  @override
  List<Object?> get props => [message, timestamp];
}

final class UnexpectedFailure extends Failure {
  UnexpectedFailure({String? message, super.timestamp})
    : super(message ?? "Erreur inattendue");
}

final class NotFoundFailure extends Failure {
  final String? resourceType;
  final String? resourceId;
  NotFoundFailure({this.resourceType, this.resourceId})
    : super("Ressource introuvable");

  @override
  List<Object?> get props => [...super.props, resourceType, resourceId];
  // Optionnel : une méthode pour faciliter le debug/log
  @override
  String toString() => 'NotFoundFailure($resourceType #$resourceId): $message';
}
