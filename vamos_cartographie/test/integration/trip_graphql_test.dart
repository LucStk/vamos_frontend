// Tests d'intégration — nécessitent un serveur Django local sur localhost:8000.
//
// Fusion de :
//   • test/data/graphql/trip_test.dart
//   • test/api_test.dart
//
// Ces tests sont ignorés par défaut (requièrent un backend actif).

import 'package:ferry/ferry.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/core/network/graphql/ferry_client.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Utilitaires
// ─────────────────────────────────────────────────────────────────────────────

void _printError(dynamic response) {
  if (response.linkException != null) {
    print('Erreur Réseau/Lien: ${response.linkException}');
  }
  if (response.graphqlErrors != null) {
    print('Erreurs GraphQL: ${response.graphqlErrors}');
  }
}

Future<GTripFields> _createTrip(Client client) async {
  final req = GCreateTripReq(
    vars: GCreateTripVars(
      trip: GTripInput(
        title: 'test création',
        description: const Value.present('ceci est un test de création'),
      ),
    ),
  );
  final response = await client.request(req).first;
  _printError(response);
  expect(response.data?.createTrip.title, 'test création');
  return response.data!.createTrip;
}

Future<GGetTripData_trip> _getTripById(int id, Client client) async {
  final req = GGetTripReq(vars: GGetTripVars(id: id));
  final response = await client.request(req).first;
  expect(response.data, isNotNull);
  return response.data!.trip;
}

Future<void> _deleteTrip(int id, Client client) async {
  final req = GDeleteTripReq(vars: GDeleteTripVars(id: id));
  final response = await client.request(req).first;
  _printError(response);
  expect(response.data?.deleteTrip, isNotNull);
}

// ─────────────────────────────────────────────────────────────────────────────
// Tests d'intégration
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  final skipReason = const bool.fromEnvironment('RUN_INTEGRATION')
      ? false
      : 'Requiert un serveur local (lancez avec --dart-define=RUN_INTEGRATION=true)';
  // ---------------------------------------------------------------------------
  // Tests GraphQL bruts (ex-trip_test.dart)
  // ---------------------------------------------------------------------------

  test('Trip query — liste des trips + getTrip par id', () async {
    final client = initFerryClient('http://localhost:8000/graphql/');

    final request = GGetAllTripsReq();
    final response = await client.request(request).first;
    expect(response.data?.trips, isNotNull);

    final firstTripTitle = response.data?.trips.first.title;
    print('Titre du premier voyage : $firstTripTitle');

    final firstTripId = response.data?.trips.first.id;
    print('ID du premier voyage : $firstTripId');
    expect(firstTripId, isNotNull);

    final tripResponse = await _getTripById(firstTripId!, client);
    print('Réponse du getTrip : ${tripResponse.id}');
    expect(tripResponse.id, isNotNull);
  }, skip: skipReason);

  test('Trip création et modification', () async {
    final client = initFerryClient('http://localhost:8000/graphql/');
    final newTrip = await _createTrip(client);
    final id = newTrip.id;
    expect(id, isNotNull);

    final updateReq = GUpdateTripReq(
      vars: GUpdateTripVars(
        id: id,
        trip: GTripUpdateInput(
          title: const Value.present('test modification'),
          description: const Value.present('ceci est un test de modification'),
        ),
      ),
    );
    final updateResponse = await client.request(updateReq).first;
    print('updateTripResponse: ${updateResponse.data?.updateTrip}');
    expect(updateResponse.data?.updateTrip, isNotNull);

    await _deleteTrip(id, client);
  }, skip: skipReason);

  // ---------------------------------------------------------------------------
  // Tests CRUD complet (ex-api_test.dart)
  // ---------------------------------------------------------------------------

  test('Trip création / lecture / modification / suppression', () async {
    final client = initFerryClient('http://localhost:8000/graphql/');

    // ── Création ────────────────────────────────────────────────────────
    final createReq = GCreateTripReq(
      vars: GCreateTripVars(
        trip: GTripInput(
          title: 'Trip venant de la création',
          description: const Value.present('ceci est une description'),
          date: Value.present(
            DateTime.now().toIso8601String().substring(0, 10),
          ),
        ),
      ),
    );
    final createResponse = await client.request(createReq).first;
    _printError(createResponse);
    expect(createResponse.data?.createTrip, isNotNull);
    final id = createResponse.data!.createTrip.id;
    print('Trip bien créé dans la base de données id : $id');

    // ── Lecture ─────────────────────────────────────────────────────────
    final fetchedTrip = await _getTripById(id, client);
    print('trip retourné : ${fetchedTrip.id}');
    expect(fetchedTrip.id, id);

    // ── Modification ─────────────────────────────────────────────────────
    print('Modification du trip {id: $id}');
    final updateReq = GUpdateTripReq(
      vars: GUpdateTripVars(
        id: id,
        trip: GTripUpdateInput(
          title: const Value.present('Trip modifié'),
          description: const Value.present('description modifiée'),
        ),
      ),
    );
    final updateResponse = await client.request(updateReq).first;
    _printError(updateResponse);
    expect(updateResponse.data?.updateTrip, isNotNull);
    print('Trip mis à jour avec succès');

    // ── Suppression ──────────────────────────────────────────────────────
    print('Suppression du trip {id: $id}');
    await _deleteTrip(id, client);
    print('Trip supprimé avec succès');
  }, skip: skipReason);
}
