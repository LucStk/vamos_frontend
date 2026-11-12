import 'package:domain_core/domain_core.dart';

class RoutingFailure extends Failure {
  RoutingFailure({this.reason})
    : super(
        "L'itinéraire n'a pas pu être calculé : votre tracé à main levée a été conservé",
      );

  /// Valeur de `refinementError` renvoyée par le serveur. Logs uniquement.
  final String? reason;

  @override
  List<Object?> get props => [...super.props, reason];
}
