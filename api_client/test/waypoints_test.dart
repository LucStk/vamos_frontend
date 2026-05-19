import 'package:api_client/src/ferry_client.dart';
// Importe le fichier .req.gql.dart (il contient la classe de requête)
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
  test("Creation et modification avec waypoints et segments", () async {
    final client = initFerryClient('http://localhost:8000/graphql/');
    final newTripRequest = GCreateTripReq(
      vars: GCreateTripVars(
        trip: GTripInput(
          title: "test création",
          description: Value.present("ceci est un test de créàtion"),
          date: Value.present(DateTime.now().toIso8601String().split('T')[0]),
          waypoints: Value.present([
            GWaypointInput(
              lat: 0.1,
              lng: 0.1,
              type: GWaypointTypeEnum.start,
              description: Value.present('Ceci est le point de départ'),
            ),
          ]),
          segments: Value.present([
            GSegmentInput(
              type: GSegmentTypeEnum.bike,
              intermediatePoints: [GLatLngInput(lat: 0.1, lng: 0.1)],
            ),
          ]),
        ),
      ),
    );
    final newTripResponse = await client.request(newTripRequest).first;
    printError(newTripResponse);
    expect(newTripResponse.data?.createTrip, isNotNull);
    final id = newTripResponse.data?.createTrip.id;
    print("ID du voyage créé : $id");
    expect(id, isNotNull);
    // Test pour la modification du voyage

    final updateTripRequest = GUpdateTripReq(
      vars: GUpdateTripVars(
        id: id!,
        trip: GTripUpdateInput(
          title: Value.present("test modification"),
          description: Value.present("ceci est un test de modification"),
          date: Value.present(DateTime.now().toIso8601String().split('T')[0]),
          waypoints: Value.present([
            GWaypointInput(
              lat: 0.1,
              lng: 0.1,
              type: GWaypointTypeEnum.start,
              description: Value.present('Ceci est le point de départ'),
              title: Value.present('Point de départ'),
            ),
          ]),
          segments: Value.present([
            GSegmentInput(
              type: GSegmentTypeEnum.bike,
              intermediatePoints: [GLatLngInput(lat: 0.1, lng: 0.1)],
            ),
          ]),
        ),
      ),
    );
    final updateTripResponse = await client.request(updateTripRequest).first;
    printError(updateTripResponse);
    expect(updateTripResponse.data?.updateTrip, isNotNull);
    // Test pour la suppression du voyage
    final deleteTripRequest = GDeleteTripReq(vars: GDeleteTripVars(id: id));
    final deleteTripResponse = await client.request(deleteTripRequest).first;
    expect(deleteTripResponse.data?.deleteTrip, isNotNull);
  });
}
