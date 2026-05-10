import 'package:api_client/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/models.dart';
import 'package:vamos_cartographie/repository/trip_repository.dart';

class MockTripRepository implements TripRepository {
  // Base de données en mémoire
  final List<Trip> _trips = [
    // --- Voyage 1 : Tour de Bretagne à vélo ---
    Trip(
      id: 'mock-001',
      title: 'Tour de Bretagne à vélo',
      description:
          'Un grand tour de Bretagne en passant par Rennes, Brest et le long des côtes bretonnes. Paysages grandioses, crêpes et cidre garantis !',
      date: DateTime(2024, 7, 14),
      waypoints: [
        Waypoint(
          id: 'wp-001-1',
          latLng: LatLng(48.8566, 2.3522), // Paris
          type: GWaypointTypeEnum.start,
          description: 'Départ depuis Paris',
        ),
        Waypoint(
          id: 'wp-001-2',
          latLng: LatLng(48.1173, -1.6778), // Rennes
          type: GWaypointTypeEnum.waypoint,
          description: 'Étape à Rennes — centre historique',
        ),
        Waypoint(
          id: 'wp-001-3',
          latLng: LatLng(48.3904, -4.4861), // Brest
          type: GWaypointTypeEnum.viewpoint,
          description: 'Vue sur la rade de Brest',
        ),
        Waypoint(
          id: 'wp-001-4',
          latLng: LatLng(47.6587, -2.7600), // Vannes
          type: GWaypointTypeEnum.food,
          description: 'Ravitaillement au marché de Vannes',
        ),
        Waypoint(
          id: 'wp-001-5',
          latLng: LatLng(47.2184, -1.5536), // Nantes
          type: GWaypointTypeEnum.end,
          description: 'Arrivée à Nantes',
        ),
      ],
      segments: [
        Segment(id: 'seg-001-1', type: GSegmentTypeEnum.train),
        Segment(
          id: 'seg-001-2',
          type: GSegmentTypeEnum.bike,
          intermediatePoints: [
            LatLng(48.2523, -2.9060), // Saint-Brieuc
          ],
        ),
        Segment(id: 'seg-001-3', type: GSegmentTypeEnum.bike),
        Segment(id: 'seg-001-4', type: GSegmentTypeEnum.bike),
      ],
    ),

    // --- Voyage 2 : Route des vins d'Alsace ---
    Trip(
      id: 'mock-002',
      title: "Route des vins d'Alsace",
      description:
          "La célèbre route des vins entre Strasbourg et Mulhouse, en vélo et à pied, avec des arrêts dans les plus beaux villages alsaciens.",
      date: DateTime(2024, 9, 5),
      waypoints: [
        Waypoint(
          id: 'wp-002-1',
          latLng: LatLng(48.5734, 7.7521), // Strasbourg
          type: GWaypointTypeEnum.start,
          description: 'Départ de Strasbourg',
        ),
        Waypoint(
          id: 'wp-002-2',
          latLng: LatLng(48.2500, 7.3100), // Sélestat
          type: GWaypointTypeEnum.historic,
          description: 'Patrimoine médiéval de Sélestat',
        ),
        Waypoint(
          id: 'wp-002-3',
          latLng: LatLng(48.0791, 7.3580), // Colmar
          type: GWaypointTypeEnum.food,
          description: 'Dégustation de vins à Colmar',
        ),
        Waypoint(
          id: 'wp-002-4',
          latLng: LatLng(47.8683, 7.3174), // Rouffach
          type: GWaypointTypeEnum.viewpoint,
          description: 'Point de vue sur les vignes',
        ),
        Waypoint(
          id: 'wp-002-5',
          latLng: LatLng(47.7508, 7.3359), // Mulhouse
          type: GWaypointTypeEnum.end,
          description: 'Arrivée à Mulhouse',
        ),
      ],
      segments: [
        Segment(id: 'seg-002-1', type: GSegmentTypeEnum.bike),
        Segment(
          id: 'seg-002-2',
          type: GSegmentTypeEnum.bike,
          intermediatePoints: [
            LatLng(48.1638, 7.3350), // Ribeauvillé
          ],
        ),
        Segment(id: 'seg-002-3', type: GSegmentTypeEnum.walk),
        Segment(id: 'seg-002-4', type: GSegmentTypeEnum.bike),
      ],
    ),

    // --- Voyage 3 : Traversée des Pyrénées ---
    Trip(
      id: 'mock-003',
      title: 'Traversée des Pyrénées',
      description:
          'Un périple épique à vélo à travers les contreforts pyrénéens, de la côte basque jusqu\'aux sommets de Lourdes. Dénivelés garantis !',
      date: DateTime(2024, 8, 20),
      waypoints: [
        Waypoint(
          id: 'wp-003-1',
          latLng: LatLng(43.4929, -1.4748), // Bayonne
          type: GWaypointTypeEnum.start,
          description: 'Départ de Bayonne',
        ),
        Waypoint(
          id: 'wp-003-2',
          latLng: LatLng(43.2951, -0.3708), // Pau
          type: GWaypointTypeEnum.water,
          description: 'Point d\'eau au gave de Pau',
        ),
        Waypoint(
          id: 'wp-003-3',
          latLng: LatLng(43.1042, -0.0785), // Tarbes
          type: GWaypointTypeEnum.camping,
          description: 'Nuit en camping à Tarbes',
        ),
        Waypoint(
          id: 'wp-003-4',
          latLng: LatLng(43.0958, -0.0461), // Lourdes
          type: GWaypointTypeEnum.end,
          description: 'Arrivée à Lourdes',
        ),
      ],
      segments: [
        Segment(
          id: 'seg-003-1',
          type: GSegmentTypeEnum.bike,
          intermediatePoints: [
            LatLng(43.4800, -0.7750), // Orthez
          ],
        ),
        Segment(id: 'seg-003-2', type: GSegmentTypeEnum.bike),
        Segment(id: 'seg-003-3', type: GSegmentTypeEnum.bike),
      ],
    ),
  ];

  static const _delay = Duration(milliseconds: 400);

  @override
  Future<Either<Failure, List<GTripFieldsData>>> getAllTrips() async {
    await Future.delayed(_delay);
    final result = _trips
        .map(
          (t) => GTripFieldsData(
            id: t.id!,
            title: t.title,
            date: t.date?.toIso8601String().substring(0, 10),
            description: t.description,
            imageUrls: const <String>[],
          ),
        )
        .toList();
    return Right(result);
  }

  @override
  Future<Either<Failure, Trip>> getTrip(String id) async {
    await Future.delayed(_delay);
    try {
      return Right(_trips.firstWhere((t) => t.id == id));
    } catch (_) {
      return Left(NotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, String>> createTrip(Trip trip) async {
    await Future.delayed(_delay);
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    _trips.add(
      Trip(
        id: id,
        title: trip.title,
        description: trip.description,
        date: trip.date,
        waypoints: trip.waypoints,
        segments: trip.segments,
      ),
    );
    return Right(id);
  }

  @override
  Future<Either<Failure, String>> updateTrip(Trip trip) async {
    await Future.delayed(_delay);
    final index = _trips.indexWhere((t) => t.id == trip.id);
    if (index == -1) return Left(NotFoundFailure());
    _trips[index] = trip;
    return Right(trip.id!);
  }

  @override
  Future<Either<Failure, bool>> deleteTrip(String id) async {
    await Future.delayed(_delay);
    final index = _trips.indexWhere((t) => t.id == id);
    if (index == -1) return Left(NotFoundFailure());
    _trips.removeAt(index);
    return Right(true);
  }
}
