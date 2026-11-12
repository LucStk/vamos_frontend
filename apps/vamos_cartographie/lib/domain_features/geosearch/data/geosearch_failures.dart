/// Si vos autres features étendent une classe Failure commune
/// (core/errors/server_failures.dart), faites hériter celle-ci de la même base.
sealed class GeosearchFailure implements Exception {
  const GeosearchFailure(this.message);

  final String message;

  @override
  String toString() => message;
}

/// Paramètres refusés par le serveur (BAD_USER_INPUT).
final class InvalidSearchFailure extends GeosearchFailure {
  const InvalidSearchFailure(super.message);
}

/// Photon est injoignable côté serveur (SEARCH_UNAVAILABLE) ou trop lent.
final class SearchUnavailableFailure extends GeosearchFailure {
  const SearchUnavailableFailure()
    : super('Service de recherche indisponible, réessayez plus tard.');
}

/// Pas de réponse exploitable (réseau, erreur inattendue).
final class SearchNetworkFailure extends GeosearchFailure {
  const SearchNetworkFailure()
    : super('Recherche impossible, vérifiez votre connexion.');
}
