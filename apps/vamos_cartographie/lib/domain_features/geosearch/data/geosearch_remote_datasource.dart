import 'package:ferry/ferry.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/graphql/graphql.dart' show GSearchMode;
import 'package:vamos_cartographie/core/mappers/geometry_mappers/position_mapper.dart';

import 'graphql/graphql.dart';

/// Erreur brute de la requête, convertie en GeosearchFailure par le repository
/// (voir mappers/geosearch_exceptions_mappers.dart).
class GeosearchRequestException implements Exception {
  const GeosearchRequestException({this.code, this.message});

  /// extensions.code renvoyé par le serveur : BAD_USER_INPUT, SEARCH_UNAVAILABLE...
  final String? code;
  final String? message;
}

class GeosearchRemoteDatasource {
  const GeosearchRemoteDatasource(this._client);

  final Client _client;

  // Si votre ferry_client_x.dart fournit déjà un helper "requête unique" qui
  // gère erreurs et exceptions, utilisez-le à la place du bloc ci-dessous.
  Future<GSearchPlacesData> searchPlaces({
    required String query,
    LatLng? origin,
    required int limit,
    double? radiusKm,
    required GSearchMode mode,
  }) async {
    final request = GSearchPlacesReq(
      vars: GSearchPlacesVars(
        q: query,
        origin: (origin != null)
            ? Value.present(origin.toGQLInput())
            : Value.absent(),
        limit: limit,
        radiusKm: (radiusKm != null) ? Value.present(radiusKm) : Value.absent(),
        mode: mode,
      ),
      // Le serveur cache déjà les réponses. On évite le cache normalisé de
      // Ferry : les PlaceResult y sont fusionnés par `id`, or `distanceM`
      // dépend de la position de recherche (des réponses d'origines
      // différentes s'écraseraient entre elles).
      fetchPolicy: FetchPolicy.NoCache,
    );

    final response = await _client
        .request(request)
        .first
        .timeout(const Duration(seconds: 10));

    if (response.hasErrors) {
      final errors = response.graphqlErrors;
      if (errors != null && errors.isNotEmpty) {
        final first = errors.first;
        throw GeosearchRequestException(
          code: first.extensions?['code'] as String?,
          message: first.message,
        );
      }
      throw const GeosearchRequestException(); // linkException : réseau
    }

    final data = response.data;
    if (data == null) throw const GeosearchRequestException();
    return data;
  }
}
