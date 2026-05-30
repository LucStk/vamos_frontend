import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/i_trip_repository.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/data/repositories/i_waypoint_repository.dart';

class MockWaypointRepository implements IWaypointRepository {
  final ITripRepository _tripRepository;
  static const _delay = Duration(milliseconds: 300);

  MockWaypointRepository(this._tripRepository);

  @override
  Future<Either<Failure, Waypoint>> createWaypoint(
    int tripId,
    WaypointDraft waypoint,
  ) async {
    await Future.delayed(_delay);

    // 1. Récupérer tous les voyages pour trouver celui correspont au tripId
    final tripsResult = await _tripRepository.getAllTrips();

    return tripsResult.fold((failure) => Left(failure), (trips) async {
      final Trip trip = trips.where((t) => t.id == tripId).first;

      // 3. Créer le waypoint
      final createWaypoint = Waypoint(
        id: trip.waypoints.length,
        latLng: waypoint.latLng,
        type: waypoint.type,
        title: waypoint.title,
        description: waypoint.description,
      );

      // 4. Ajouter le Waypoint dans la liste
      final List<Waypoint> updatedWaypoints = [
        ...trip.waypoints,
        createWaypoint,
      ];

      // 5. Sauvegarder les changements dans le TripRepository via un TripDraft
      final updateResult = await _tripRepository.updateTrip(
        tripId,
        trip.toDraft().copyWith(waypoints: updatedWaypoints),
      );

      // 6. Retourner le waypoint modifié si tout s'est bien passé
      return updateResult.fold(
        (failure) => Left(failure),
        (_) => Right(createWaypoint),
      );
    });
  }

  @override
  Future<Either<Failure, Waypoint>> updateWaypoint(
    int id,
    WaypointDraft waypoint,
  ) async {
    await Future.delayed(_delay);

    // 1. Récupérer tous les voyages pour trouver celui qui contient ce waypoint
    final tripsResult = await _tripRepository.getAllTrips();

    return tripsResult.fold((failure) => Left(failure), (trips) async {
      Trip? targetTrip;
      int waypointIndex = -1;

      // 2. Parcourir les voyages pour localiser le waypoint
      for (final trip in trips) {
        waypointIndex = trip.waypoints.indexWhere((w) => w.id == id);
        if (waypointIndex != -1) {
          targetTrip = trip;
          break; // On a trouvé le voyage et le waypoint !
        }
      }

      // Si le waypoint n'existe dans aucun voyage
      if (targetTrip == null || waypointIndex == -1) {
        return Left(const NotFoundFailure());
      }

      // 3. Créer le waypoint mis à jour
      final updatedWaypoint = Waypoint(
        id: id,
        latLng: waypoint.latLng,
        type: waypoint.type,
        title: waypoint.title ?? targetTrip.waypoints[waypointIndex].title,
        description:
            waypoint.description ??
            targetTrip.waypoints[waypointIndex].description,
      );

      // 4. Cloner et mettre à jour la liste des waypoints de ce voyage
      final updatedWaypoints = List<Waypoint>.from(targetTrip.waypoints);
      updatedWaypoints[waypointIndex] = updatedWaypoint;

      // 5. Sauvegarder les changements dans le TripRepository via un TripDraft
      final updateResult = await _tripRepository.updateTrip(
        targetTrip.id,
        TripDraft(
          title: targetTrip.title,
          description: targetTrip.description,
          date: targetTrip.date,
          images: targetTrip.images,
          segments: targetTrip.segments,
          waypoints: updatedWaypoints, // Notre liste modifiée
        ),
      );

      // 6. Retourner le waypoint modifié si tout s'est bien passé
      return updateResult.fold(
        (failure) => Left(failure),
        (_) => Right(updatedWaypoint),
      );
    });
  }

  @override
  Future<Either<Failure, void>> deleteWaypoint(int id) async {
    await Future.delayed(_delay);

    // 1. Récupérer tous les voyages pour trouver celui correspont au tripId
    final tripsResult = await _tripRepository.getAllTrips();

    return tripsResult.fold((failure) => Left(failure), (trips) async {
      Trip? targetTrip;
      int waypointIndex = -1;

      // 2. Parcourir les voyages pour localiser le waypoint
      for (final trip in trips) {
        waypointIndex = trip.waypoints.indexWhere((w) => w.id == id);
        if (waypointIndex != -1) {
          targetTrip = trip;
          break; // On a trouvé le voyage et le waypoint !
        }
      }
      // Si le waypoint n'existe dans aucun voyage
      if (targetTrip == null || waypointIndex == -1) {
        return Left(const NotFoundFailure());
      }
      // 4. Enlever le Waypoint dans la liste
      final List<Waypoint> updatedWaypoints = [
        ...targetTrip.waypoints.where((w) => w.id != id),
      ];

      // 5. Sauvegarder les changements dans le TripRepository via un TripDraft
      final updateResult = await _tripRepository.updateTrip(
        targetTrip.id,
        targetTrip.toDraft().copyWith(waypoints: updatedWaypoints),
      );

      // 6. Retourner le waypoint modifié si tout s'est bien passé
      return updateResult.fold((failure) => Left(failure), (_) => Right(null));
    });
  }
}
