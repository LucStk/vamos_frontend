// Tests d'intégration — nécessitent un serveur Django local sur localhost:8000.
//
// Fusion de :
//   • test/data/graphql/waypoints_test.dart
//
// Note : le schéma courant (GTripInput) ne propose pas de champs `waypoints`
// ni `segments` dans le type d'entrée de création. De même, GWaypointInput,
// GSegmentInput et GLatLngInput ne sont pas encore générés.
// Le test de création de waypoints via GTripInput est donc commenté en attendant
// la mise à jour du schéma GQL côté backend.
//
// Ce qui est testé ici : update individuel d'un waypoint existant.

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

// ─────────────────────────────────────────────────────────────────────────────
// Tests d'intégration
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  const skipReason = 'Requiert un serveur local sur localhost:8000';

  // ---------------------------------------------------------------------------
  // Mise à jour individuelle d'un waypoint (ex-waypoints_test.dart, partie updateWaypoint)
  //
  // Pré-condition : un trip avec au moins un waypoint doit exister côté serveur.
  // L'id du waypoint doit être fourni manuellement.
  // ---------------------------------------------------------------------------

  test(
    'Mise à jour individuelle d\'un waypoint via GUpdateWaypointReq',
    () async {
      final client = initFerryClient('http://localhost:8000/graphql/');

      // Créer un trip minimal (sans waypoints via l'API courante, le schéma
      // actuel ne supporte pas waypoints dans GTripInput).
      final createTripReq = GCreateTripReq(
        vars: GCreateTripVars(
          trip: GTripInput(
            title: 'test waypoint update',
            description: const Value.present('test intégration waypoint'),
          ),
        ),
      );
      final createTripResponse = await client.request(createTripReq).first;
      _printError(createTripResponse);
      expect(createTripResponse.data?.createTrip, isNotNull);
      final tripId = createTripResponse.data!.createTrip.id;
      print('Trip créé id : $tripId');

      // Récupérer le trip complet pour accéder aux waypoints éventuels.
      final getTripReq = GGetTripReq(vars: GGetTripVars(id: tripId));
      final getTripResponse = await client.request(getTripReq).first;
      expect(getTripResponse.data?.trip, isNotNull);

      final waypoints = getTripResponse.data!.trip.waypoints;
      if (waypoints.isEmpty) {
        print(
          'Aucun waypoint sur ce trip — test updateWaypoint ignoré. '
          'Créez le trip avec des waypoints si vous souhaitez tester cela.',
        );
        // Nettoyage
        await client
            .request(GDeleteTripReq(vars: GDeleteTripVars(id: tripId)))
            .first;
        return;
      }

      final waypointId = waypoints.first.id;

      // Mettre à jour le waypoint
      final updateWaypointReq = GUpdateWaypointReq(
        vars: GUpdateWaypointVars(
          id: waypointId,
          waypoint: GWaypointUpdateInput(
            title: const Value.present('update title test'),
            lat: const Value.present(0.0),
            lng: const Value.present(1.1),
            description: const Value.present('Nouvelle description'),
            type: const Value.present(GWaypointEnum.BEACH),
          ),
        ),
      );
      final updateWaypointResponse = await client
          .request(updateWaypointReq)
          .first;
      _printError(updateWaypointResponse);
      expect(updateWaypointResponse.data?.updateWaypoint, isNotNull);
      print(
        'Waypoint $waypointId mis à jour : '
        '${updateWaypointResponse.data?.updateWaypoint}',
      );

      // Nettoyage
      final deleteReq = GDeleteTripReq(vars: GDeleteTripVars(id: tripId));
      final deleteResponse = await client.request(deleteReq).first;
      expect(deleteResponse.data?.deleteTrip, isNotNull);
    },
    skip: skipReason,
  );

  // ---------------------------------------------------------------------------
  // TODO : Création avec waypoints et segments
  //
  // Le schéma actuel (GQL généré) ne dispose pas de GWaypointInput /
  // GSegmentInput / GLatLngInput dans GTripInput.
  // Ce test sera activé quand ces types seront ajoutés au schéma backend.
  // ---------------------------------------------------------------------------

  test(
    'TODO — Création avec waypoints et segments via GTripInput '
    '(schéma non supporté actuellement)',
    () {
      // Les types GWaypointInput, GSegmentInput, GLatLngInput ne sont pas
      // encore générés dans le schéma courant.
      // Voir le fichier original test/data/graphql/waypoints_test.dart pour
      // la version qui utilise ces types (prévu pour une future mise à jour
      // du schéma GraphQL backend).
    },
    skip: 'GWaypointInput/GSegmentInput non disponibles dans le schéma actuel',
  );
}
