import 'package:domain_core/domain_core.dart';

enum RoutingFailureReason { routerUnavailable, noRouteFound, emptyRoute, unknown }

/// Le routeur n'a pas pu affiner le tracé : la géométrie à main levée est
/// conservée telle quelle (sections DRAWN).
class RoutingFailure extends Failure {
  RoutingFailure(this.reason) : super(_messageFor(reason));

  final RoutingFailureReason reason;

  static String _messageFor(RoutingFailureReason reason) => switch (reason) {
    RoutingFailureReason.routerUnavailable =>
      "Le service d'itinéraire est indisponible : votre tracé à main levée a été conservé",
    RoutingFailureReason.noRouteFound =>
      "Aucun itinéraire trouvé pour ce tracé avec cette mobilité : votre tracé à main levée a été conservé",
    RoutingFailureReason.emptyRoute =>
      "Le calcul n'a renvoyé aucun itinéraire : votre tracé à main levée a été conservé",
    RoutingFailureReason.unknown =>
      "L'itinéraire n'a pas pu être calculé : votre tracé à main levée a été conservé",
  };

  @override
  List<Object?> get props => [...super.props, reason];
}
