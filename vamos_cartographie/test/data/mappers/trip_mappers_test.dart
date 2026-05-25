import 'package:api_client/api_client.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/trips/data/mappers/trip_mappers.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Helpers GQL — évitent la répétition dans les tests
// ─────────────────────────────────────────────────────────────────────────────

GImageFieldsData _image({
  String url = 'https://cdn/img.jpg',
  String fileKey = 'media/img.jpg',
}) => GImageFieldsData(url: url, fileKey: fileKey);

GTripFieldsData_images _tripFieldsImage() =>
    GTripFieldsData_images(image: _image());

GWaypointFieldsData _gqlWaypoint({
  int id = 0,
  double lat = 48.85,
  double lng = 2.35,
  GWaypointEnum type = GWaypointEnum.WAYPOINT,
  String title = 'Mon waypoint',
  String description = 'Une description',
}) => GWaypointFieldsData(
  id: id,
  lat: lat,
  lng: lng,
  type: type,
  title: title,
  description: description,
  images: [],
);

GSegmentFieldsData _gqlSegment({
  GSegmentTypeEnum type = GSegmentTypeEnum.bike,
  List<GSegmentFieldsData_intermediatePoints>? intermediatePoints,
}) => GSegmentFieldsData(
  type: type,
  intermediatePoints:
      intermediatePoints ??
      [GSegmentFieldsData_intermediatePoints(lat: 48.0, lng: 2.0)],
);

GTripFieldsData _gqlTripFields({
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
  images: images ?? [_tripFieldsImage()],
);

GGetTripData_trip _gqlTripDetail({
  int id = 1,
  String title = 'Tour de test',
  String? date = '2024-07-14',
  String description = 'Une belle aventure',
  List<GGetTripData_trip_images>? images,
  List<GWaypointFieldsData>? waypoints,
  List<GSegmentFieldsData>? segments,
}) => GGetTripData_trip(
  id: id,
  title: title,
  date: date,
  description: description,
  images: images ?? [GGetTripData_trip_images(image: _image())],
  // 2 waypoints → 1 segment (invariant du modèle Trip)
  waypoints: waypoints ?? [_gqlWaypoint(id: 1), _gqlWaypoint(id: 2)],
  segments: segments ?? [_gqlSegment()],
);

GCreateTripData_createTrip _gqlCreateResult({
  int id = 42,
  String title = 'Nouveau trip',
  String? date,
  String description = 'Créé via mutation',
  List<GCreateTripData_createTrip_images>? images,
  List<GWaypointFieldsData>? waypoints,
  List<GSegmentFieldsData>? segments,
}) => GCreateTripData_createTrip(
  id: id,
  title: title,
  date: date,
  description: description,
  images: images ?? [GCreateTripData_createTrip_images(image: _image())],
  // 2 waypoints → 1 segment (invariant du modèle Trip)
  waypoints: waypoints ?? [_gqlWaypoint(id: 1), _gqlWaypoint(id: 2)],
  segments: segments ?? [_gqlSegment()],
);

GUpdateTripData_updateTrip _gqlUpdateResult({
  int id = 7,
  String title = 'Trip modifié',
  String? date = '2024-08-01',
  String description = 'Mis à jour',
  List<GUpdateTripData_updateTrip_images>? images,
  List<GWaypointFieldsData>? waypoints,
  List<GSegmentFieldsData>? segments,
}) => GUpdateTripData_updateTrip(
  id: id,
  title: title,
  date: date,
  description: description,
  images: images ?? [GUpdateTripData_updateTrip_images(image: _image())],
  // 2 waypoints → 1 segment (invariant du modèle Trip)
  waypoints: waypoints ?? [_gqlWaypoint(id: 1), _gqlWaypoint(id: 2)],
  segments: segments ?? [_gqlSegment()],
);

// ─────────────────────────────────────────────────────────────────────────────
// Tests
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  // ---------------------------------------------------------------------------
  // TripMapper.segmentFromGQL — GQL → Domaine
  // ---------------------------------------------------------------------------

  group('TripMapper.segmentFromGQL', () {
    test('mappe le type et les points intermédiaires', () {
      final gql = _gqlSegment(type: GSegmentTypeEnum.walk);
      final seg = TripMapper.segmentFromGQL(gql);

      expect(seg.type, GSegmentTypeEnum.walk);
      expect(seg.intermediatePoints, hasLength(1));
      expect(seg.intermediatePoints.first, const LatLng(48.0, 2.0));
    });

    test('liste vide si aucun point intermédiaire', () {
      final gql = GSegmentFieldsData(
        type: GSegmentTypeEnum.car,
        intermediatePoints: [],
      );
      expect(TripMapper.segmentFromGQL(gql).intermediatePoints, isEmpty);
    });
  });

  // ---------------------------------------------------------------------------
  // TripMapper.tripFromGQLFields — GQL → Domaine (fragment de liste)
  // ---------------------------------------------------------------------------

  group('TripMapper.tripFromGQLFields', () {
    test('convertit les champs de base et les images correctement', () {
      final trip = TripMapper.tripFromGQLFields(_gqlTripFields(id: 5));

      expect(trip.id, 5);
      expect(trip.title, 'Tour de test');
      expect(trip.description, 'Une belle aventure');
      expect(trip.date, DateTime(2024, 7, 14));
      expect(trip.images, [
        const TripImage(url: 'https://cdn/img.jpg', fileKey: 'media/img.jpg'),
      ]);
      // tripFromGQLFields n'inclut pas de waypoints ni segments
      expect(trip.waypoints, isEmpty);
      expect(trip.segments, isEmpty);
    });

    test('date null si absente du fragment', () {
      final gql = _gqlTripFields(date: null, images: []);
      expect(TripMapper.tripFromGQLFields(gql).date, isNull);
    });

    test('mappe plusieurs images', () {
      final gql = _gqlTripFields(
        images: [
          GTripFieldsData_images(
            image: _image(url: 'https://cdn/a.jpg', fileKey: 'media/a.jpg'),
          ),
          GTripFieldsData_images(
            image: _image(url: 'https://cdn/b.jpg', fileKey: 'media/b.jpg'),
          ),
        ],
      );
      final images = TripMapper.tripFromGQLFields(gql).images;

      expect(images, hasLength(2));
      expect(images[0].fileKey, 'media/a.jpg');
      expect(images[1].fileKey, 'media/b.jpg');
    });
  });

  // ---------------------------------------------------------------------------
  // TripMapper.tripFromGQLDetail — GQL → Domaine (query détaillée)
  // ---------------------------------------------------------------------------

  group('TripMapper.tripFromGQLDetail', () {
    test('inclut les waypoints et les segments', () {
      final trip = TripMapper.tripFromGQLDetail(_gqlTripDetail(id: 3));

      expect(trip.id, 3);
      expect(trip.waypoints, hasLength(2));
      expect(trip.segments, hasLength(1));
    });

    test('waypoint bien mappé (coordonnées et type)', () {
      final trip = TripMapper.tripFromGQLDetail(_gqlTripDetail());
      final wp = trip.waypoints.first;

      expect(wp.id, 1);
      expect(wp.latLng, const LatLng(48.85, 2.35));
      expect(wp.type, GWaypointEnum.WAYPOINT);
    });

    test('segment bien mappé (type et point intermédiaire)', () {
      final trip = TripMapper.tripFromGQLDetail(_gqlTripDetail());
      final seg = trip.segments.first;

      expect(seg.type, GSegmentTypeEnum.bike);
      expect(seg.intermediatePoints, [const LatLng(48.0, 2.0)]);
    });

    test('images du trip bien mappées', () {
      final trip = TripMapper.tripFromGQLDetail(_gqlTripDetail());

      expect(trip.images, [
        const TripImage(url: 'https://cdn/img.jpg', fileKey: 'media/img.jpg'),
      ]);
    });

    test('date null si absente', () {
      final trip = TripMapper.tripFromGQLDetail(
        _gqlTripDetail(date: null, waypoints: [], segments: []),
      );
      expect(trip.date, isNull);
    });
  });

  // ---------------------------------------------------------------------------
  // TripMapper.tripFromGQLCreateResult — mutation createTrip
  // ---------------------------------------------------------------------------

  group('TripMapper.tripFromGQLCreateResult', () {
    test('convertit correctement le résultat de création', () {
      final trip = TripMapper.tripFromGQLCreateResult(_gqlCreateResult(id: 42));

      expect(trip.id, 42);
      expect(trip.title, 'Nouveau trip');
      expect(trip.description, 'Créé via mutation');
      expect(trip.date, isNull);
      expect(trip.images, [
        const TripImage(url: 'https://cdn/img.jpg', fileKey: 'media/img.jpg'),
      ]);
      expect(trip.waypoints, hasLength(2));
      expect(trip.segments, hasLength(1));
    });

    test('mappe le premier waypoint du résultat de création', () {
      final trip = TripMapper.tripFromGQLCreateResult(_gqlCreateResult());
      final wp = trip.waypoints.first;

      expect(wp.id, 1);
      expect(wp.latLng, const LatLng(48.85, 2.35));
    });
  });

  // ---------------------------------------------------------------------------
  // TripMapper.tripFromGQLUpdateResult — mutation updateTrip
  // ---------------------------------------------------------------------------

  group('TripMapper.tripFromGQLUpdateResult', () {
    test('convertit correctement le résultat de mise à jour', () {
      final trip = TripMapper.tripFromGQLUpdateResult(_gqlUpdateResult(id: 7));

      expect(trip.id, 7);
      expect(trip.title, 'Trip modifié');
      expect(trip.description, 'Mis à jour');
      expect(trip.date, DateTime(2024, 8, 1));
      expect(trip.images, [
        const TripImage(url: 'https://cdn/img.jpg', fileKey: 'media/img.jpg'),
      ]);
      expect(trip.waypoints, hasLength(2));
      expect(trip.segments, hasLength(1));
    });

    test('date null si absente du résultat de mise à jour', () {
      final trip = TripMapper.tripFromGQLUpdateResult(
        _gqlUpdateResult(date: null, waypoints: [], segments: []),
      );
      expect(trip.date, isNull);
    });
  });

  // ---------------------------------------------------------------------------
  // TripMapper.segmentToGQLInput — Domaine → GQL Input
  // ---------------------------------------------------------------------------

  group('TripMapper.segmentToGQLInput', () {
    test('mappe le type et les points intermédiaires', () {
      final seg = Segment(
        type: GSegmentTypeEnum.train,
        intermediatePoints: [const LatLng(47.0, 1.0)],
      );
      final input = TripMapper.segmentToGQLInput(seg);

      expect(input.type, GSegmentTypeEnum.train);
      expect(input.intermediatePoints, hasLength(1));
      expect(input.intermediatePoints.first.lat, 47.0);
      expect(input.intermediatePoints.first.lng, 1.0);
    });

    test('liste vide si aucun point intermédiaire', () {
      final seg = Segment(type: GSegmentTypeEnum.boat);
      final input = TripMapper.segmentToGQLInput(seg);

      expect(input.intermediatePoints, isEmpty);
    });
  });

  // ---------------------------------------------------------------------------
  // TripMapper.tripToGQLInput — Domaine → GTripInput (mutation create)
  // ---------------------------------------------------------------------------

  group('TripMapper.tripToGQLInput', () {
    test('mappe les champs principaux avec date et waypoints', () {
      final trip = Trip(
        title: 'Mon voyage',
        description: 'Super trip',
        date: DateTime(2024, 6, 1),
        waypoints: [
          Waypoint(latLng: const LatLng(1, 2), type: GWaypointEnum.START),
          Waypoint(latLng: const LatLng(3, 4), type: GWaypointEnum.END),
        ],
        segments: [Segment(type: GSegmentTypeEnum.bike)],
      );
      final input = TripMapper.tripToGQLInput(trip);

      expect(input.title, 'Mon voyage');
      expect(input.description, Value.present('Super trip'));
      expect(input.date, Value.present('2024-06-01'));
      expect(input.waypoints.isPresent, isTrue);
      expect(input.waypoints.requireValue, hasLength(2));
      expect(input.segments.isPresent, isTrue);
      expect(input.segments.requireValue, hasLength(1));
    });

    test('description absente si chaîne vide', () {
      final trip = Trip(title: 'Test', description: '');
      expect(TripMapper.tripToGQLInput(trip).description, const Value.absent());
    });

    test('date absente si null', () {
      final trip = Trip(title: 'Test', date: null);
      expect(TripMapper.tripToGQLInput(trip).date, const Value.absent());
    });

    test('waypoints absents si liste vide', () {
      final trip = Trip(title: 'Test');
      expect(TripMapper.tripToGQLInput(trip).waypoints, const Value.absent());
    });

    test('segments absents si liste vide', () {
      final trip = Trip(title: 'Test');
      expect(TripMapper.tripToGQLInput(trip).segments, const Value.absent());
    });

    test('date formatée en YYYY-MM-DD (ISO tronqué)', () {
      final trip = Trip(title: 'T', date: DateTime(2025, 1, 9));
      expect(TripMapper.tripToGQLInput(trip).date, Value.present('2025-01-09'));
    });
  });

  // ---------------------------------------------------------------------------
  // TripMapper.tripToGQLUpdateInput — Domaine → GTripUpdateInput (mutation update)
  // ---------------------------------------------------------------------------

  group('TripMapper.tripToGQLUpdateInput', () {
    test('title toujours présent', () {
      final trip = Trip(
        id: 10,
        title: 'Titre mis à jour',
        waypoints: [],
        segments: [],
      );
      expect(
        TripMapper.tripToGQLUpdateInput(trip).title,
        Value.present('Titre mis à jour'),
      );
    });

    test('description vide envoyée comme Value.present(null)', () {
      final trip = Trip(
        id: 10,
        title: 'T',
        description: '',
        waypoints: [],
        segments: [],
      );
      final input = TripMapper.tripToGQLUpdateInput(trip);

      expect(input.description.isPresent, isTrue);
      expect(input.description.requireValue, isNull);
    });

    test('description non vide envoyée comme Value.present(valeur)', () {
      final trip = Trip(
        id: 10,
        title: 'T',
        description: 'Super aventure',
        waypoints: [],
        segments: [],
      );
      expect(
        TripMapper.tripToGQLUpdateInput(trip).description,
        Value.present('Super aventure'),
      );
    });

    test('date absente si null', () {
      final trip = Trip(
        id: 10,
        title: 'T',
        date: null,
        waypoints: [],
        segments: [],
      );
      expect(TripMapper.tripToGQLUpdateInput(trip).date, const Value.absent());
    });

    test('date présente si non null, formatée en YYYY-MM-DD', () {
      final trip = Trip(
        id: 10,
        title: 'T',
        date: DateTime(2024, 12, 25),
        waypoints: [],
        segments: [],
      );
      expect(
        TripMapper.tripToGQLUpdateInput(trip).date,
        Value.present('2024-12-25'),
      );
    });

    test('waypoints présents même si liste vide', () {
      final trip = Trip(id: 10, title: 'T', waypoints: [], segments: []);
      final input = TripMapper.tripToGQLUpdateInput(trip);

      expect(input.waypoints.isPresent, isTrue);
      expect(input.waypoints.requireValue, isEmpty);
    });

    test('waypoints présents avec contenu', () {
      final trip = Trip(
        id: 10,
        title: 'T',
        waypoints: [
          Waypoint(latLng: const LatLng(48.0, 2.0), type: GWaypointEnum.START),
          Waypoint(latLng: const LatLng(43.0, 1.0), type: GWaypointEnum.END),
        ],
        segments: [Segment(type: GSegmentTypeEnum.walk)],
      );
      final input = TripMapper.tripToGQLUpdateInput(trip);

      expect(input.waypoints.isPresent, isTrue);
      expect(input.waypoints.requireValue, hasLength(2));
    });

    test('segments présents même si liste vide', () {
      final trip = Trip(id: 10, title: 'T', waypoints: [], segments: []);
      final input = TripMapper.tripToGQLUpdateInput(trip);

      expect(input.segments.isPresent, isTrue);
      expect(input.segments.requireValue, isEmpty);
    });
  });
}
