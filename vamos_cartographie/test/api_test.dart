import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/data/mappers/trip_mappers.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/i_trip_repository.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';

void main() async {
  await configureDependencies();

  test('test getAllTrips', () async {
    final result = await getIt<ITripRepository>().getAllTrips();
    result.fold(
      (failure) {
        print(failure);
        throw failure;
      },
      (trips) {
        print('voici les voyages : $trips');
      },
    );
  });

  test('Trip création / lecture / modification / suppression', () async {
    final trip = Trip(
      title: 'Trip venant de la création',
      description: 'ceci est une description',
      date: DateTime.now(),
      waypoints: [
        Waypoint(
          type: GWaypointEnum.START,
          description: 'Première description',
          latLng: const LatLng(1, 1),
        ),
        Waypoint(
          type: GWaypointEnum.END,
          description: 'dernière entrée',
          latLng: const LatLng(2, 2),
        ),
      ],
      segments: [
        Segment(
          type: GSegmentTypeEnum.bike,
          intermediatePoints: [const LatLng(1, 1), const LatLng(2, 2)],
        ),
      ],
    );

    // Création
    final createResult = await getIt<ITripRepository>().createTrip(trip);
    int? id;
    createResult.fold(
      (failure) {
        print(failure);
        throw failure;
      },
      (createdTrip) {
        id = createdTrip.id;
        print('Trip bien créé dans la base de données id : $id');
      },
    );
    print("trip id est $id");
    // Lecture
    final getTripResult = await getIt<ITripRepository>().getTrip(id!);
    getTripResult.fold(
      (failure) {
        print(failure);
        throw failure;
      },
      (fetchedTrip) {
        final json = TripMapper.tripToGQLInput(fetchedTrip).toJson();
        print('trip retourné : $json');
      },
    );

    // Modification
    print('Modification du trip {id: $id}');
    final updatedTrip = Trip(
      id: id,
      title: 'Trip modifié',
      description: 'description modifiée',
    );
    final updateResult = await getIt<ITripRepository>().updateTrip(
      id!,
      updatedTrip,
    );
    updateResult.fold((failure) {
      print(failure);
      throw failure;
    }, (_) => print('Trip mis à jour avec succès'));

    // Suppression
    print('Suppression du trip {id: $id}');
    final deleteResult = await getIt<ITripRepository>().deleteTrip(id!);
    deleteResult.fold((failure) {
      print(failure);
      throw failure;
    }, (_) => print('Trip supprimé avec succès'));
  });
}
