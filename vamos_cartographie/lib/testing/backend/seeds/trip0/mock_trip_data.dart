import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import "mock_topology_data.dart";
import "mock_waypoints_data.dart";

final Trip trip = Trip(
  id: 0,
  title: 'Tour de Bretagne à vélo',
  description:
      'Un grand tour de Bretagne en passant par Rennes, Brest et le long des côtes bretonnes. Paysages grandioses, crêpes et cidre garantis !',
  date: DateTime(2024, 7, 14),
  images: [
    MediaImage(
      fileKey: 'seed/v1',
      url: 'https://picsum.photos/seed/v1/600/400',
    ),
  ],
  waypoints: tripWaypoints,
  vertex: tripVertex,
  segments: tripSegments,
);
