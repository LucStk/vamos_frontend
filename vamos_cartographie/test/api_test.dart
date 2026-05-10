import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/repository/trip_repository.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/models.dart';

void main() async {
  // Obligatoire si tu fais du async avant runApp
  // WidgetsFlutterBinding.ensureInitialized();
  // On initialise GetIt
  await configureDependencies();
  test('test getAllTrips', () async {
    final result = await getIt<TripRepository>().getAllTrips();
    result.fold(
      (failure) {
        print(failure);
        throw failure;
      },
      (trips) {
        var t = trips.map((t) => t.toJson());
        print("voici les voyages de la base de données : {$t}");
      },
    );
  });
  test('Trip création', () async {
    final trip = Trip(
      title: "Trip venant de la création",
      description: "ceci est une description",
      date: DateTime.now(),
      waypoints: [
        Waypoint(
          type: GWaypointTypeEnum.start,
          description: "Première description",
          latLng: LatLng(1, 1),
        ),
        Waypoint(
          type: GWaypointTypeEnum.end,
          description: "dernière entré",
          latLng: LatLng(2, 2),
        ),
      ],
      segments: [
        Segment(
          type: GSegmentTypeEnum.bike,
          intermediatePoints: [LatLng(1, 1), LatLng(2, 2)],
        ),
      ],
    );

    final result = await getIt<TripRepository>().createTrip(trip);
    String? id;
    result.fold(
      (failure) {
        print(failure);
        throw failure;
      },
      (newid) {
        print("Trip bien créée dans la base de données");
        id = newid;
      },
    );
    // On tente de récupérer le trip dans la base de donner pour créer un nouvelle obj Trip
    final getTripResult = await getIt<TripRepository>().getTrip(id!);
    getTripResult.fold(
      (failure) {
        print(failure);
        throw failure;
      },
      (trip) {
        var t = trip.toGQLInput().toJson();
        print("trip return {$t}");
      },
    );

    // On tente de modifier le trip que l'on vient de créer
    print("Modification du trip créé {id:$id}");
    final updatedTrip = Trip(
      id: id,
      title: "Trip modifié",
      description: "description modifiée",
    );
    final updateResult = await getIt<TripRepository>().updateTrip(updatedTrip);
    updateResult.fold(
      (failure) {
        print(failure);
        throw failure;
      },
      (updated) {
        print("Trip mis à jour avec succès");
      },
    );
    // On tente de supprimer le trip que l'on vient de modifier
    print("Suppression du trip {id:$id}");
    final deleteResult = await getIt<TripRepository>().deleteTrip(id!);
    deleteResult.fold(
      (failure) {
        print(failure);
        throw failure;
      },
      (success) {
        print("Trip supprimé avec succès");
      },
    );
  });
}
