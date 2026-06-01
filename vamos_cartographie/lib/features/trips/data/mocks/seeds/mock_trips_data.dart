import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';

import "package:vamos_cartographie/features/segments/domain/entities/segment.dart";

final List<Trip> trips = [
  // --- Voyage 1 : Tour de Bretagne à vélo ---
  Trip(
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
    waypoints: [
      Waypoint(
        id: 0,
        latLng: LatLng(48.8566, 2.3522),
        type: GWaypointEnum.START,
        description: 'Départ depuis Paris',
      ),
      Waypoint(
        id: 1,
        latLng: LatLng(48.1173, -1.6778),
        type: GWaypointEnum.WAYPOINT,
        description: 'Étape à Rennes — centre historique',
      ),
      Waypoint(
        id: 2,
        latLng: LatLng(48.3904, -4.4861),
        type: GWaypointEnum.VIEWPOINT,
        description: 'Vue sur la rade de Brest',
      ),
      Waypoint(
        id: 3,
        latLng: LatLng(47.6587, -2.7600),
        type: GWaypointEnum.FOOD,
        description: 'Ravitaillement au marché de Vannes',
      ),
      Waypoint(
        id: 4,
        latLng: LatLng(47.2184, -1.5536),
        type: GWaypointEnum.END,
        description: 'Arrivée à Nantes',
      ),
    ],
    segments: [
      Segment(id: 1, type: GSegmentTypeEnum.train),
      Segment(
        id: 2,
        type: GSegmentTypeEnum.bike,
        intermediatePoints: [LatLng(48.2523, -2.9060)],
      ),
      Segment(id: 3, type: GSegmentTypeEnum.bike),
      Segment(id: 4, type: GSegmentTypeEnum.bike),
    ],
  ),

  // --- Voyage 2 : Route des vins d'Alsace ---
  Trip(
    id: 2,
    title: "Route des vins d'Alsace",
    description:
        "La célèbre route des vins entre Strasbourg et Mulhouse, en vélo et à pied, avec des arrêts dans les plus beaux villages alsaciens.",
    date: DateTime(2024, 9, 5),
    waypoints: [
      Waypoint(
        id: 21,
        latLng: LatLng(48.5734, 7.7521),
        type: GWaypointEnum.START,
        description: 'Départ de Strasbourg',
      ),
      Waypoint(
        id: 22,
        latLng: LatLng(48.2500, 7.3100),
        type: GWaypointEnum.HISTORIC,
        description: 'Patrimoine médiéval de Sélestat',
      ),
      Waypoint(
        id: 23,
        latLng: LatLng(48.0791, 7.3580),
        type: GWaypointEnum.FOOD,
        description: 'Dégustation de vins à Colmar',
      ),
      Waypoint(
        id: 24,
        latLng: LatLng(47.8683, 7.3174),
        type: GWaypointEnum.VIEWPOINT,
        description: 'Point de vue sur les vignes',
      ),
      Waypoint(
        id: 25,
        latLng: LatLng(47.7508, 7.3359),
        type: GWaypointEnum.END,
        description: 'Arrivée à Mulhouse',
      ),
    ],
    segments: [
      Segment(id: 101, type: GSegmentTypeEnum.bike),
      Segment(
        id: 102,
        type: GSegmentTypeEnum.bike,
        intermediatePoints: [LatLng(48.1638, 7.3350)],
      ),
      Segment(id: 103, type: GSegmentTypeEnum.walk),
      Segment(id: 104, type: GSegmentTypeEnum.bike),
    ],
  ),

  // --- Voyage 3 : Traversée des Pyrénées ---
  Trip(
    id: 3,
    title: 'Traversée des Pyrénées',
    description:
        'Un périple épique à vélo à travers les contreforts pyrénéens, de la côte basque jusqu\'aux sommets de Lourdes.',
    date: DateTime(2024, 8, 20),
    waypoints: [
      Waypoint(
        id: 30,
        title: "départ",
        latLng: LatLng(43.4929, -1.4748),
        type: GWaypointEnum.START,
        description: 'Départ de Bayonne',
      ),
      Waypoint(
        id: 31,
        title: "Super point d'eau",
        latLng: LatLng(43.2951, -0.3708),
        type: GWaypointEnum.WATER,
        description: "Point d'eau au gave de Pau",
      ),
      Waypoint(
        id: 32,
        latLng: LatLng(43.1042, -0.0785),
        type: GWaypointEnum.CAMPING,
        description: 'Nuit en camping à Tarbes',
      ),
      Waypoint(
        id: 33,
        latLng: LatLng(43.0958, -0.0461),
        type: GWaypointEnum.END,
        description: 'Arrivée à Lourdes',
      ),
    ],
    segments: [
      Segment(
        id: 201,
        type: GSegmentTypeEnum.bike,
        intermediatePoints: [LatLng(43.4800, -0.7750)],
      ),
      Segment(id: 202, type: GSegmentTypeEnum.bike),
      Segment(id: 203, type: GSegmentTypeEnum.bike),
    ],
  ),
];
