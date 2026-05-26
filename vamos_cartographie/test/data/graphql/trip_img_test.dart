import 'dart:math';

import 'package:ferry/ferry.dart';

import 'package:api_client/api_client.dart';
import 'package:test/test.dart';
import './trip_test.dart';

void printError(response) {
  if (response.linkException != null) {
    print("Erreur Réseau/Lien: ${response.linkException}");
  }

  // Affiche les erreurs retournées par Django (ex: colonnes manquantes, fautes de frappe)
  if (response.graphqlErrors != null) {
    print("Erreurs GraphQL: ${response.graphqlErrors}");
  }
}

Future<void> addMediaImage(client, tripId, fileKey) async {
  final MediaImageResponse = await client
      .request(
        GAttachImageToTripReq(
          vars: GAttachImageToTripVars(tripId: tripId, fileKey: fileKey),
        ),
      )
      .first;
  expect(MediaImageResponse.data, isNotNull);
}

Future<void> deleteMediaImage(Client client, int tripId, String fileKey) async {
  final response = await client
      .request(
        GDeleteImageFromTripReq(
          vars: GDeleteImageFromTripVars(tripId: tripId, fileKey: fileKey),
        ),
      )
      .first; // <-- Crucial : Déclenche le Stream et attend la réponse

  // Optionnel mais recommandé en mode test : s'assurer qu'il n'y a pas d'erreurs GraphQL
  if (response.hasErrors) {
    throw Exception(
      response.graphqlErrors?.first.message ?? 'Erreur lors de la suppression',
    );
  }
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
    await addMediaImage(client, tripId, fileKey);

    // Vérification que l'image est bien attachée au trip
    final tripByIdResponse = await getTripById(tripId, client);
    print(tripByIdResponse.images.first.image.url);
    print(tripByIdResponse.images.first.image.fileKey);
    expect(tripByIdResponse, isNotNull);

    // Suppression de l'image dans le trip
    print("test de suppression");
    await deleteMediaImage(client, tripId, fileKey);
    await deleteTripRequest(tripId, client);
  });
}
