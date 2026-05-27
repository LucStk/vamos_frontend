import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:ferry/ferry.dart';
import 'package:test/test.dart';

import 'package:vamos_cartographie/core/network/graphql/ferry_client.dart';
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

Future<GCreateTripData_createTrip> newTripRequest(Client client) async {
  final newTripRequest = GCreateTripReq(
    vars: GCreateTripVars(
      trip: GTripInput(
        title: "test création",
        description: Value.present("ceci est un test de création"),
      ),
    ),
  );
  final newTripResponse = await client.request(newTripRequest).first;
  printError(newTripResponse);
  expect(newTripResponse.data?.createTrip.title, "test création");
  return newTripResponse.data!.createTrip;
}

Future<GGetTripData_trip> getTripById(int id, Client client) async {
  final tripRequest = GGetTripReq(vars: GGetTripVars(id: id));
  final tripResponse = await client.request(tripRequest).first;
  expect(tripResponse.data, isNotNull);
  return tripResponse.data!.trip;
}

Future<void> deleteTripRequest(int id, Client client) async {
  final deleteTripRequest = GDeleteTripReq(vars: GDeleteTripVars(id: id));
  final deleteTripResponse = await client.request(deleteTripRequest).first;
  printError(deleteTripResponse);
  expect(deleteTripResponse.data?.deleteTrip, isNotNull);
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
    final tripResponse = await getTripById(firstTripId!, client);
    print('Réponse du getTrip : ${tripResponse.id}');
    expect(tripResponse.id, isNotNull);
  });

  test("Creation et modification", () async {
    final client = initFerryClient('http://localhost:8000/graphql/');
    final newTrip = await newTripRequest(client);
    final id = newTrip.id;
    expect(id, isNotNull);
    // Test pour la modification du voyage
    final updateTripRequest = GUpdateTripReq(
      vars: GUpdateTripVars(
        id: id,
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
    await deleteTripRequest(id, client);
  });
}
