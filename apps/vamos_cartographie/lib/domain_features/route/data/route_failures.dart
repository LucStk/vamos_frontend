// route_failures.dart
import 'package:domain_core/domain_core.dart';

sealed class RouteEditFailure extends Failure {
  /// Message brut du serveur : logs/debug uniquement, jamais affiché.
  final String? serverMessage;

  RouteEditFailure(super.userMessage, {this.serverMessage});

  @override
  List<Object?> get props => [...super.props, serverMessage];
}

class StaleRouteFailure extends RouteEditFailure {
  StaleRouteFailure({super.serverMessage})
    : super("La route a changé entre-temps, veuillez réessayer");
}

class InvalidRouteAnchorFailure extends RouteEditFailure {
  InvalidRouteAnchorFailure({super.serverMessage})
    : super("Ce point n'est pas sur la section choisie");
}

class InvalidRouteEditFailure extends RouteEditFailure {
  InvalidRouteEditFailure({super.serverMessage})
    : super("Cette modification de la route est impossible");
}

class RouteTripNotFoundFailure extends RouteEditFailure {
  RouteTripNotFoundFailure({super.serverMessage})
    : super("Ce voyage est introuvable");
}

/// Code absent ou non reconnu (ex: nouveau code serveur pas encore géré).
class UnknownRouteEditFailure extends RouteEditFailure {
  final String? code;

  UnknownRouteEditFailure({this.code, super.serverMessage})
    : super("Erreur dans la modification de la route");

  @override
  List<Object?> get props => [...super.props, code];
}

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
