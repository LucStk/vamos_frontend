import 'package:domain_core/domain_core.dart';

/// Erreurs d'édition de la route d'un trip. Chaque classe correspond au
/// `extensions.code` renvoyé par le serveur (voir route_failure_mapper.dart).
sealed class RouteEditFailure extends Failure {
  RouteEditFailure({String? message})
    : super(message ?? "Erreur dans la modification de la route");
}

/// STALE_ROUTE : la route a changé depuis sa dernière lecture (autre onglet,
/// double clic, section qui n'existe plus). Recharger le trip avant de réessayer.
class StaleRouteFailure extends RouteEditFailure {
  StaleRouteFailure()
    : super(message: "La route a changé entre-temps, veuillez réessayer");
}

/// INVALID_ANCHOR : le point cliqué ne peut pas être rattaché à la section indiquée.
class InvalidRouteAnchorFailure extends RouteEditFailure {
  InvalidRouteAnchorFailure()
    : super(message: "Ce point n'est pas sur la section choisie");
}

/// INVALID_EDIT : édition impossible (début et fin confondus, route déjà existante...).
class InvalidRouteEditFailure extends RouteEditFailure {
  InvalidRouteEditFailure()
    : super(message: "Cette modification de la route est impossible");
}

/// NOT_FOUND : le trip n'existe pas (ou plus).
class RouteTripNotFoundFailure extends RouteEditFailure {
  RouteTripNotFoundFailure() : super(message: "Ce voyage est introuvable");
}

/// Le routeur a échoué (`refinementFailed: true`), mais l'édition a RÉUSSI :
/// la portion est enregistrée en tracé brut (DRAWN).
///
/// Volontairement HORS de [RouteEditFailure] : ce n'est pas un échec de
/// l'opération, il ne doit pas voyager dans le côté « erreur » d'un résultat.
/// Il est porté par le résultat de succès (voir RouteEditResult).
class RoutingFailure extends Failure {
  RoutingFailure()
    : super(
        "L'itinéraire n'a pas pu être calculé : votre tracé à main levé a été conservé",
      );
}
