import 'package:equatable/equatable.dart';
import "package:intl/intl.dart";
// domain_core/lib/failure.dart

part "queries_failures.dart";
part "server_failures.dart";
part "auth_failures.dart";
part "user_profile_failures.dart";

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
