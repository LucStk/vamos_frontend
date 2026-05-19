import 'package:api_client/src/ferry_client.dart';
// Importe le fichier .req.gql.dart (il contient la classe de requête)
import 'package:api_client/src/graphql/queries/__generated__/trip.req.gql.dart';
import 'package:api_client/src/graphql/queries/__generated__/trip.var.gql.dart';
import 'package:api_client/src/graphql/mutations/__generated__/trip.var.gql.dart';
import 'package:api_client/src/graphql/mutations/__generated__/trip.req.gql.dart';
import 'package:api_client/src/graphql/__generated__/schema.schema.gql.dart';
import 'package:test/test.dart';

import 'package:gql_tristate_value/gql_tristate_value.dart';

void printError(response) {
  if (response.linkException != null) {
    print("Erreur Réseau/Lien: ${response.linkException}");
  }

  // Affiche les erreurs retournées par Django (ex: colonnes manquantes, fautes de frappe)
  if (response.graphqlErrors != null) {
    print("Erreurs GraphQL: ${response.graphqlErrors}");
  }
}

void main() {
  test('Trip query', () async {
    final client = initFerryClient('http://localhost:8000/graphql/');

    // 1. On utilise la classe générée : GMyQuery
    // 2. On utilise client.request()
    // 3. On utilise .first pour attendre la première réponse (car request renvoie un Stream)
    final request = GGetAllTripsReq();
    final response = await client.request(request).first;
    expect(response.data?.trips, isNotNull);

    // Bonus : accès typé aux données
    final firstTripTitle = response.data?.trips.first.title;
    print('Titre du premier voyage : $firstTripTitle');

    final firstTripId = response.data?.trips.first.id;
    print('ID du premier voyage : $firstTripId');

    expect(firstTripId, isNotNull);
    // Test pour le getTrip
    final tripRequest = GGetTripReq(vars: GGetTripVars(id: firstTripId!));
    final tripResponse = await client.request(tripRequest).first;
    print('Réponse du getTrip : ${tripResponse.data}');
    expect(tripResponse.data, isNotNull);
  });

  test("Creation et modification", () async {
    final client = initFerryClient('http://localhost:8000/graphql/');
    final newTripRequest = GCreateTripReq(
      vars: GCreateTripVars(
        trip: GTripInput(
          title: "test création",
          description: Value.present("ceci est un test de création"),
        ),
      ),
    );
    final newTripResponse = await client.request(newTripRequest).first;
    expect(newTripResponse.data?.createTrip, isNotNull);
    final id = newTripResponse.data?.createTrip.id;
    expect(id, isNotNull);
    // Test pour la modification du voyage
    final updateTripRequest = GUpdateTripReq(
      vars: GUpdateTripVars(
        id: id!,
        trip: GTripUpdateInput(
          title: Value.present("test modification"),
          description: Value.present("ceci est un test de modification"),
        ),
      ),
    );
    final updateTripResponse = await client.request(updateTripRequest).first;
    print("updateTripResponse: ${updateTripResponse.data?.updateTrip}");
    expect(updateTripResponse.data?.updateTrip, isNotNull);
    // Test pour la suppression du voyage
    final deleteTripRequest = GDeleteTripReq(vars: GDeleteTripVars(id: id));
    final deleteTripResponse = await client.request(deleteTripRequest).first;
    expect(deleteTripResponse.data?.deleteTrip, isNotNull);
  });
}
