import 'dart:math';

import 'package:api_client/api_client.dart';
import 'package:test/test.dart';
import './trip_test.dart';
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

Future<void> addTripImage(client, tripId, fileKey) async {
  final tripImageResponse = await client
      .request(
        GAttachImageToTripReq(
          vars: GAttachImageToTripVars(tripId: tripId, fileKey: fileKey),
        ),
      )
      .first;
  expect(tripImageResponse.data, isNotNull);
}

void main() {
  test('Création d\'une image pour un voyage', () async {
    final client = initFerryClient('http://localhost:8000/graphql/');
    var fileKey = Random().nextInt(1000000).toString();
    // Création d'une image pour un voyage
    final imageResponse = await client
        .request(GCreateImageReq(vars: GCreateImageVars(fileKey: fileKey)))
        .first;

    expect(imageResponse.data, isNotNull);
    // Création d'un trip
    final tripResponse = await newTripRequest(client);
    final tripId = tripResponse.id;

    // Ajout d'une image au trip
    await addTripImage(client, tripId, fileKey);

    // Vérification que l'image est bien attachée au trip
    final tripByIdResponse = await getTripById(tripId, client);
    print(tripByIdResponse.images.first.image.url);
    print(tripByIdResponse.images.first.image.fileKey);
    expect(tripByIdResponse, isNotNull);

    // Suppression du trip
    await deleteTripRequest(tripId, client);
  });
}
