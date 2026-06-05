import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:uuid/uuid.dart';

import "package:vamos_cartographie/features/segments/domain/domain.dart";

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
        vertexId: 0,
        latLng: LatLng(48.8566, 2.3522),
        type: WaypointType.start,
        description: 'Départ depuis Paris',
      ),
      Waypoint(
        id: 1,
        vertexId: 1,
        latLng: LatLng(48.1173, -1.6778),
        type: WaypointType.waypoint,
        description: 'Étape à Rennes — centre historique',
      ),
      Waypoint(
        id: 2,
        vertexId: 2,
        latLng: LatLng(48.3904, -4.4861),
        type: WaypointType.viewpoint,
        description: 'Vue sur la rade de Brest',
      ),
      Waypoint(
        id: 3,
        vertexId: 3,
        latLng: LatLng(47.6587, -2.7600),
        type: WaypointType.food,
        description: 'Ravitaillement au marché de Vannes',
      ),
      Waypoint(
        id: 4,
        vertexId: 4,
        latLng: LatLng(47.2184, -1.5536),
        type: WaypointType.end,
        description: 'Arrivée à Nantes',
      ),
    ],
    segments: [
      Segment(
        id: 1,
        type: SegmentType.train,
        middleVertices: [],
        startWaypointId: 0,
        endWaypointId: 1,
      ),
      Segment(
        id: 2,
        type: SegmentType.bike,
        middleVertices: [
          SegmentVertex(id: const Uuid().v4(), point: LatLng(48.2523, -2.9060)),
        ],
        startWaypointId: 1,
        endWaypointId: 2,
      ),
      Segment(
        id: 3,
        type: SegmentType.bike,
        middleVertices: [],
        startWaypointId: 2,
        endWaypointId: 3,
      ),
      Segment(
        id: 4,
        type: SegmentType.bike,
        middleVertices: [],
        startWaypointId: 3,
        endWaypointId: 4,
      ),
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
        vertexId: 21,
        latLng: LatLng(48.5734, 7.7521),
        type: WaypointType.start,
        description: 'Départ de Strasbourg',
      ),
      Waypoint(
        id: 22,
        vertexId: 22,
        latLng: LatLng(48.2500, 7.3100),
        type: WaypointType.historic,
        description: 'Patrimoine médiéval de Sélestat',
      ),
      Waypoint(
        id: 23,
        vertexId: 23,
        latLng: LatLng(48.0791, 7.3580),
        type: WaypointType.food,
        description: 'Dégustation de vins à Colmar',
      ),
      Waypoint(
        id: 24,
        vertexId: 24,
        latLng: LatLng(47.8683, 7.3174),
        type: WaypointType.viewpoint,
        description: 'Point de vue sur les vignes',
      ),
      Waypoint(
        id: 25,
        vertexId: 25,
        latLng: LatLng(47.7508, 7.3359),
        type: WaypointType.end,
        description: 'Arrivée à Mulhouse',
      ),
    ],
    segments: [
      Segment(
        id: 101,
        type: SegmentType.bike,
        middleVertices: [],
        startWaypointId: 21,
        endWaypointId: 22,
      ),
      Segment(
        id: 102,
        type: SegmentType.bike,
        middleVertices: [
          SegmentVertex(id: const Uuid().v4(), point: LatLng(48.1638, 7.3350)),
        ],
        startWaypointId: 22,
        endWaypointId: 23,
      ),
      Segment(
        id: 103,
        type: SegmentType.walk,
        middleVertices: [],
        startWaypointId: 23,
        endWaypointId: 24,
      ),
      Segment(
        id: 104,
        type: SegmentType.bike,
        middleVertices: [],
        startWaypointId: 24,
        endWaypointId: 25,
      ),
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
        vertexId: 30,
        title: "départ",
        latLng: LatLng(43.4929, -1.4748),
        type: WaypointType.start,
        description: 'Départ de Bayonne',
      ),
      Waypoint(
        id: 31,
        vertexId: 31,
        title: "Super point d'eau",
        latLng: LatLng(43.2951, -0.3708),
        type: WaypointType.water,
        description: "Point d'eau au gave de Pau",
      ),
      Waypoint(
        id: 32,
        vertexId: 32,
        latLng: LatLng(43.1042, -0.0785),
        type: WaypointType.camping,
        description: 'Nuit en camping à Tarbes',
      ),
      Waypoint(
        id: 33,
        vertexId: 33,
        latLng: LatLng(43.0958, -0.0461),
        type: WaypointType.end,
        description: 'Arrivée à Lourdes',
      ),
    ],
    segments: [
      Segment(
        id: 201,
        type: SegmentType.bike,
        middleVertices: [
          SegmentVertex(id: const Uuid().v4(), point: LatLng(43.4800, -0.7750)),
        ],
        startWaypointId: 30,
        endWaypointId: 31,
      ),
      Segment(
        id: 202,
        type: SegmentType.bike,
        middleVertices: [],
        startWaypointId: 31,
        endWaypointId: 32,
      ),
      Segment(
        id: 203,
        type: SegmentType.bike,
        middleVertices: [],
        startWaypointId: 32,
        endWaypointId: 33,
      ),
    ],
  ),
];
