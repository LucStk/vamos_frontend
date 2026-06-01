import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/i_trip_repository.dart';
import "seeds/mock_trips_data.dart";

class MockTripRepository implements ITripRepository {
  // Base de données en mémoire
  static const _delay = Duration(milliseconds: 400);

  @override
  Future<Either<Failure, List<Trip>>> getAllTrips() async {
    await Future.delayed(_delay);
    return Right(List.unmodifiable(trips));
  }

  @override
  Future<Either<Failure, Trip>> getTrip(int id) async {
    await Future.delayed(_delay);
    try {
      return Right(trips.firstWhere((t) => t.id == id));
    } catch (_) {
      return Left(const NotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, Trip>> createTrip(TripDraft trip) async {
    await Future.delayed(_delay);
    final id = DateTime.now().millisecondsSinceEpoch;
    final created = Trip(
      id: id,
      title: trip.title,
      description: trip.description,
      date: trip.date,
      images: trip.images,
      waypoints: trip.waypoints,
      segments: trip.segments,
    );
    trips.add(created);
    return Right(created);
  }

  @override
  Future<Either<Failure, Trip>> updateTrip(int id, TripDraft trip) async {
    await Future.delayed(_delay);
    final index = trips.indexWhere((t) => t.id == id);
    if (index == -1) return Left(const NotFoundFailure());
    final updated = Trip(
      id: id,
      title: trip.title,
      description: trip.description,
      date: trip.date,
      images: trip.images,
      waypoints: trip.waypoints,
      segments: trip.segments,
    );
    trips[index] = updated;
    return Right(updated);
  }

  @override
  Future<Either<Failure, void>> deleteTrip(int id) async {
    await Future.delayed(_delay);
    final index = trips.indexWhere((t) => t.id == id);
    if (index == -1) return Left(const NotFoundFailure());
    trips.removeAt(index);
    return const Right(null);
  }
}
