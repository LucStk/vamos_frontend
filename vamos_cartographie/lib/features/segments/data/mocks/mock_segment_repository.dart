import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/i_trip_repository.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/segments/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/segments/data/repositories/i_segment_repository.dart';

class MockSegmentRepository implements ISegmentRepository {
  final ITripRepository _tripRepository;
  static const _delay = Duration(milliseconds: 300);

  MockSegmentRepository(this._tripRepository);
  @override
  Future<Either<Failure, List<Segment>>> getSegments(int tripId) async {
    // 1. Récupérer tous les voyages pour trouver celui correspont au tripId
    final tripsResult = await _tripRepository.getAllTrips();

    return tripsResult.fold((failure) => Left(failure), (trips) async {
      final Trip trip = trips.where((t) => t.id == tripId).first;
      // 6. Retourner le segment modifié si tout s'est bien passé
      return Right(trip.segments);
    });
  }

  @override
  Future<Either<Failure, Segment>> createSegment(
    int tripId,
    SegmentDraft segment,
  ) async {
    await Future.delayed(_delay);

    // 1. Récupérer tous les voyages pour trouver celui correspont au tripId
    final tripsResult = await _tripRepository.getAllTrips();

    return tripsResult.fold((failure) => Left(failure), (trips) async {
      final Trip trip = trips.where((t) => t.id == tripId).first;

      // 3. Créer le segment
      final createSegment = Segment(
        id: trip.segments.length,
        type: segment.type,
        intermediatePoints: segment.intermediatePoints,
        startWaypointId: segment.startWaypointId,
        endWaypointId: segment.endWaypointId,
      );

      // 4. Ajouter le Segment dans la liste
      final List<Segment> updatedSegments = [...trip.segments, createSegment];

      // 5. Sauvegarder les changements dans le TripRepository via un TripDraft
      final updateResult = await _tripRepository.updateTrip(
        tripId,
        trip.toDraft().copyWith(segments: updatedSegments),
      );

      // 6. Retourner le segment modifié si tout s'est bien passé
      return updateResult.fold(
        (failure) => Left(failure),
        (_) => Right(createSegment),
      );
    });
  }

  @override
  Future<Either<Failure, Segment>> updateSegment(
    int id,
    SegmentDraft segment,
  ) async {
    await Future.delayed(_delay);

    // 1. Récupérer tous les voyages pour trouver celui qui contient ce segment
    final tripsResult = await _tripRepository.getAllTrips();

    return tripsResult.fold((failure) => Left(failure), (trips) async {
      Trip? targetTrip;
      int segmentIndex = -1;

      // 2. Parcourir les voyages pour localiser le segment
      for (final trip in trips) {
        segmentIndex = trip.segments.indexWhere((w) => w.id == id);
        if (segmentIndex != -1) {
          targetTrip = trip;
          break; // On a trouvé le voyage et le segment !
        }
      }

      // Si le segment n'existe dans aucun voyage
      if (targetTrip == null || segmentIndex == -1) {
        return Left(const NotFoundFailure());
      }

      // 3. Créer le segment mis à jour
      final updatedSegment = Segment(
        id: id,
        type: segment.type,
        intermediatePoints: segment.intermediatePoints,
        startWaypointId: segment.startWaypointId,
        endWaypointId: segment.endWaypointId,
      );

      // 4. Cloner et mettre à jour la liste des segments de ce voyage
      final updatedSegments = List<Segment>.from(targetTrip.segments);
      updatedSegments[segmentIndex] = updatedSegment;

      // 5. Sauvegarder les changements dans le TripRepository via un TripDraft
      final updateResult = await _tripRepository.updateTrip(
        targetTrip.id,
        TripDraft(
          title: targetTrip.title,
          description: targetTrip.description,
          date: targetTrip.date,
          images: targetTrip.images,
          waypoints: targetTrip.waypoints,
          segments: updatedSegments, // Notre liste modifiée
        ),
      );

      // 6. Retourner le segment modifié si tout s'est bien passé
      return updateResult.fold(
        (failure) => Left(failure),
        (_) => Right(updatedSegment),
      );
    });
  }

  @override
  Future<Either<Failure, void>> deleteSegment(int id) async {
    await Future.delayed(_delay);

    // 1. Récupérer tous les voyages pour trouver celui correspont au tripId
    final tripsResult = await _tripRepository.getAllTrips();

    return tripsResult.fold((failure) => Left(failure), (trips) async {
      Trip? targetTrip;
      int segmentIndex = -1;

      // 2. Parcourir les voyages pour localiser le segment
      for (final trip in trips) {
        segmentIndex = trip.segments.indexWhere((w) => w.id == id);
        if (segmentIndex != -1) {
          targetTrip = trip;
          break; // On a trouvé le voyage et le segment !
        }
      }
      // Si le segment n'existe dans aucun voyage
      if (targetTrip == null || segmentIndex == -1) {
        return Left(const NotFoundFailure());
      }
      // 4. Enlever le Segment dans la liste
      final List<Segment> updatedSegments = [
        ...targetTrip.segments.where((w) => w.id != id),
      ];

      // 5. Sauvegarder les changements dans le TripRepository via un TripDraft
      final updateResult = await _tripRepository.updateTrip(
        targetTrip.id,
        targetTrip.toDraft().copyWith(segments: updatedSegments),
      );

      // 6. Retourner le segment modifié si tout s'est bien passé
      return updateResult.fold((failure) => Left(failure), (_) => Right(null));
    });
  }
}
