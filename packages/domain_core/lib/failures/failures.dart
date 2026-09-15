import 'package:equatable/equatable.dart';

// domain_core/lib/failure.dart

part "queries_failures.dart";
part "server_failures.dart";
part "auth_failures.dart";
part "user_profile_failures.dart";

sealed class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

final class UnexpectedFailure extends Failure {
  final String? debugInfo;
  const UnexpectedFailure({this.debugInfo}) : super("Erreur inattendue");
  @override
  List<Object?> get props => [...super.props, debugInfo];
}
