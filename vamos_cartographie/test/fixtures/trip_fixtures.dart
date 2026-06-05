import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import 'waypoint_fixtures.dart';
import 'segment_fixtures.dart';

// ── Constantes partagées ─────────────────────────────────────────────────────

const kTestFileKey = 'media/test.jpg';
const kTestImageUrl = 'https://cdn/test.jpg';

// ── GQL Image ────────────────────────────────────────────────────────────────

GImageFieldsData gImageData({
  String fileKey = kTestFileKey,
  String url = kTestImageUrl,
}) => GImageFieldsData(fileKey: fileKey, url: url);

MediaImage domainMediaImage({
  String fileKey = kTestFileKey,
  String url = kTestImageUrl,
}) => MediaImage(fileKey: fileKey, url: url);

// ── GTripFieldsData (fragment de liste) ──────────────────────────────────────
//
// Utilisé pour :
//   • TripMapper.fromGQLFields  (liste de trips, pas de waypoints/segments)
//   • TripMapper.fromGQLCreateResult (résultat de createTrip — GTripFields)
//   • TripMapper.fromGQLUpdateResult (résultat de updateTrip — GTripFields)
//
// Note : GCreateTripData.createTrip et GUpdateTripData.updateTrip retournent
// tous les deux un [GTripFieldsData] (qui implémente l'interface [GTripFields]).
// Le fragment TripFields ne contient PAS de waypoints/segments.

GTripFieldsData gTripFieldsData({
  int id = 1,
  String title = 'Tour de test',
  String? date = '2024-07-14',
  String description = 'Une belle aventure',
  List<GTripFieldsData_images>? images,
}) => GTripFieldsData(
  id: id,
  title: title,
  date: date,
  description: description,
  images: images ?? [GTripFieldsData_images(image: gImageData())],
);

// ── GGetTripData_trip (query détaillée avec waypoints et segments) ────────────

GGetTripData_trip gTripDetailData({
  int id = 1,
  String title = 'Tour de test',
  String? date = '2024-07-14',
  String description = 'Une belle aventure',
  List<GGetTripData_trip_images>? images,
  List<GWaypointFieldsData>? waypoints,
  List<GVertexFieldsData>? vertices,
  List<GSegmentFieldsData>? segments,
}) {
  // Si waypoints n'est pas fourni, créer des waypoints par défaut
  final defaultWaypoints =
      waypoints ??
      [gWaypointData(id: 1, vertexId: 1), gWaypointData(id: 2, vertexId: 2)];

  // Si vertices n'est pas fourni, créer des vertices par défaut
  final defaultVertices =
      vertices ??
      [
        GVertexFieldsData(
          id: 1,
          latLng: GLatLngFieldsData(lat: 48.85, lng: 2.35),
        ),
        GVertexFieldsData(
          id: 2,
          latLng: GLatLngFieldsData(lat: 48.86, lng: 2.36),
        ),
      ];

  return GGetTripData_trip(
    id: id,
    title: title,
    date: date,
    description: description,
    images: images ?? [GGetTripData_trip_images(image: gImageData())],
    waypoints: defaultWaypoints,
    topology: GGetTripData_trip_topology(
      vertices: defaultVertices,
      segments: segments ?? [gSegmentData()],
    ),
  );
}

// ── Helpers pour les mutations create/update ──────────────────────────────────
//
// La mutation createTrip retourne GCreateTripData dont le champ .createTrip
// est de type GTripFieldsData.  Idem pour updateTrip → GTripFieldsData.

GTripFieldsData gCreateTripResult({
  int id = 42,
  String title = 'Nouveau trip',
  String? date,
  String description = 'Créé via mutation',
  List<GTripFieldsData_images>? images,
}) => GTripFieldsData(
  id: id,
  title: title,
  date: date,
  description: description,
  images: images ?? [GTripFieldsData_images(image: gImageData())],
);

GTripFieldsData gUpdateTripResult({
  int id = 7,
  String title = 'Trip modifié',
  String? date = '2024-08-01',
  String description = 'Mis à jour',
  List<GTripFieldsData_images>? images,
}) => GTripFieldsData(
  id: id,
  title: title,
  date: date,
  description: description,
  images: images ?? [GTripFieldsData_images(image: gImageData())],
);

GDeleteTripData gDeleteTripResult(int id) => GDeleteTripData(deleteTrip: true);

// ── Domain fixtures ──────────────────────────────────────────────────────────

TripDraft domainTripDraft({
  String title = 'Test',
  String description = 'Desc',
  DateTime? date,
  List<MediaImage> images = const [],
}) => TripDraft(
  title: title,
  description: description,
  date: date,
  images: images,
);
