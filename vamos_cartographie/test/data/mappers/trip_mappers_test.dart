import 'package:api_client/api_client.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/data/mappers/trip_mappers.dart';
import 'package:vamos_cartographie/domain/domain.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Helpers — données GQL de test
// ─────────────────────────────────────────────────────────────────────────────

GImageFieldsData _image({
  String url = 'https://cdn/img.jpg',
  String fileKey = 'media/img.jpg',
}) => GImageFieldsData(url: url, fileKey: fileKey);

GWaypointFieldsData_images _waypointImage() =>
    GWaypointFieldsData_images(image: _image());

GTripFieldsData_images _tripImage() => GTripFieldsData_images(image: _image());

GWaypointFieldsData _gqlWaypoint({
  int id = 0,
  double lat = 48.85,
  double lng = 2.35,
  GWaypointTypeEnum type = GWaypointTypeEnum.waypoint,
  String title = 'Mon waypoint',
  String description = 'Une description',
}) => GWaypointFieldsData(
  id: id,
  lat: lat,
  lng: lng,
  type: type,
  title: title,
  description: description,
  images: [_waypointImage()],
);

GSegmentFieldsData _gqlSegment({
  GSegmentTypeEnum type = GSegmentTypeEnum.bike,
}) => GSegmentFieldsData(
  type: type,
  intermediatePoints: [
    GSegmentFieldsData_intermediatePoints(lat: 48.0, lng: 2.0),
  ],
);

GTripFieldsData _gqlTripFields({int id = 1}) => GTripFieldsData(
  id: id,
  title: 'Tour de test',
  date: '2024-07-14',
  description: 'Une belle aventure',
  images: [_tripImage()],
);

GGetTripData_trip _gqlTripDetail({int id = 1}) => GGetTripData_trip(
  id: id,
  title: 'Tour de test',
  date: '2024-07-14',
  description: 'Une belle aventure',
  images: [GGetTripData_trip_images(image: _image())],
  // 2 waypoints → 1 segment (invariant du modèle Trip)
  waypoints: [_gqlWaypoint(id: 1), _gqlWaypoint(id: 2)],
  segments: [_gqlSegment()],
);

GCreateTripData_createTrip _gqlCreateResult({int id = 42}) =>
    GCreateTripData_createTrip(
      id: id,
      title: 'Nouveau trip',
      date: null,
      description: 'Créé via mutation',
      images: [GCreateTripData_createTrip_images(image: _image())],
      // 2 waypoints → 1 segment
      waypoints: [_gqlWaypoint(id: 1), _gqlWaypoint(id: 2)],
      segments: [_gqlSegment()],
    );

GUpdateTripData_updateTrip _gqlUpdateResult({int id = 7}) =>
    GUpdateTripData_updateTrip(
      id: id,
      title: 'Trip modifié',
      date: '2024-08-01',
      description: 'Mis à jour',
      images: [GUpdateTripData_updateTrip_images(image: _image())],
      // 2 waypoints → 1 segment
      waypoints: [_gqlWaypoint(id: 1), _gqlWaypoint(id: 2)],
      segments: [_gqlSegment()],
    );

// ─────────────────────────────────────────────────────────────────────────────
// Tests
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  // ---------------------------------------------------------------------------
  // GQL → Domaine
  // ---------------------------------------------------------------------------

  group('TripMapper.waypointFromGQL', () {
    test('mappe les coordonnées, le type et la description', () {
      final gql = _gqlWaypoint(
        id: 2,
        lat: 43.0,
        lng: 1.5,
        type: GWaypointTypeEnum.camping,
        description: 'Camping sympa',
      );
      final wp = TripMapper.waypointFromGQL(gql);

      expect(wp.id, 2);
      expect(wp.latLng.latitude, 43.0);
      expect(wp.latLng.longitude, 1.5);
      expect(wp.type, GWaypointTypeEnum.camping);
      expect(wp.description, 'Camping sympa');
    });

    test('extrait le fileKey de chaque image', () {
      final gql = _gqlWaypoint();
      final wp = TripMapper.waypointFromGQL(gql);

      expect(wp.images, [
        TripImage(url: 'https://cdn/img.jpg', fileKey: 'media/img.jpg'),
      ]);
    });

    test('liste vide si aucune image', () {
      final gql = GWaypointFieldsData(
        id: 0,
        lat: 0,
        lng: 0,
        type: GWaypointTypeEnum.waypoint,
        title: '',
        description: '',
        images: [],
      );
      expect(TripMapper.waypointFromGQL(gql).images, isEmpty);
    });
  });

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

  group('TripMapper.tripFromGQLFields', () {
    test('convertit les champs de base correctement', () {
      final trip = TripMapper.tripFromGQLFields(_gqlTripFields(id: 5));

      expect(trip.id, 5);
      expect(trip.title, 'Tour de test');
      expect(trip.description, 'Une belle aventure');
      expect(trip.date, DateTime(2024, 7, 14));
      expect(trip.images, [
        TripImage(url: 'https://cdn/img.jpg', fileKey: 'media/img.jpg'),
      ]);
      expect(trip.waypoints, isEmpty);
      expect(trip.segments, isEmpty);
    });

    test('date null si absente', () {
      final gql = GTripFieldsData(
        id: 1,
        title: 'Sans date',
        date: null,
        description: '',
        images: [],
      );
      expect(TripMapper.tripFromGQLFields(gql).date, isNull);
    });
  });

  group('TripMapper.tripFromGQLDetail', () {
    test('inclut les waypoints et segments', () {
      final trip = TripMapper.tripFromGQLDetail(_gqlTripDetail(id: 3));

      expect(trip.id, 3);
      expect(trip.waypoints, hasLength(2));
      expect(trip.segments, hasLength(1));
    });

    test('waypoint bien mappé dans le détail', () {
      final trip = TripMapper.tripFromGQLDetail(_gqlTripDetail());
      final wp = trip.waypoints.first;

      expect(wp.id, 1);
      expect(wp.latLng, const LatLng(48.85, 2.35));
    });
  });

  group('TripMapper.tripFromGQLCreateResult', () {
    test('convertit correctement le résultat de création', () {
      final trip = TripMapper.tripFromGQLCreateResult(_gqlCreateResult(id: 42));

      expect(trip.id, 42);
      expect(trip.title, 'Nouveau trip');
      expect(trip.date, isNull);
      expect(trip.waypoints, hasLength(2));
      expect(trip.segments, hasLength(1));
    });
  });

  group('TripMapper.tripFromGQLUpdateResult', () {
    test('convertit correctement le résultat de mise à jour', () {
      final trip = TripMapper.tripFromGQLUpdateResult(_gqlUpdateResult(id: 7));

      expect(trip.id, 7);
      expect(trip.title, 'Trip modifié');
      expect(trip.date, DateTime(2024, 8, 1));
    });
  });

  // ---------------------------------------------------------------------------
  // Domaine → GQL Input
  // ---------------------------------------------------------------------------

  group('TripMapper.waypointToGQLInput', () {
    test('mappe les coordonnées et le type', () {
      final wp = Waypoint(
        latLng: const LatLng(44.0, 3.0),
        type: GWaypointTypeEnum.water,
        description: 'Source',
      );
      final input = TripMapper.waypointToGQLInput(wp);

      expect(input.lat, 44.0);
      expect(input.lng, 3.0);
      expect(input.type, GWaypointTypeEnum.water);
      expect(input.description, Value.present('Source'));
    });

    test('description absente si vide', () {
      final wp = Waypoint(
        latLng: const LatLng(0, 0),
        type: GWaypointTypeEnum.waypoint,
        description: '',
      );
      expect(
        TripMapper.waypointToGQLInput(wp).description,
        const Value.absent(),
      );
    });

    test('description absente si null', () {
      final wp = Waypoint(
        latLng: const LatLng(0, 0),
        type: GWaypointTypeEnum.waypoint,
        description: null,
      );
      expect(
        TripMapper.waypointToGQLInput(wp).description,
        const Value.absent(),
      );
    });
  });

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
  });

  group('TripMapper.tripToGQLInput', () {
    test('mappe les champs principaux', () {
      final trip = Trip(
        title: 'Mon voyage',
        description: 'Super trip',
        date: DateTime(2024, 6, 1),
        waypoints: [
          Waypoint(latLng: const LatLng(1, 2), type: GWaypointTypeEnum.start),
          Waypoint(latLng: const LatLng(3, 4), type: GWaypointTypeEnum.end),
        ],
        segments: [Segment(type: GSegmentTypeEnum.bike)],
      );
      final input = TripMapper.tripToGQLInput(trip);

      expect(input.title, 'Mon voyage');
      expect(input.description, Value.present('Super trip'));
      expect(input.date, Value.present('2024-06-01'));
      expect(input.waypoints.requireValue, hasLength(2));
      expect(input.segments.requireValue, hasLength(1));
    });

    test('description absente si vide', () {
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
  });

  group('TripMapper.tripToGQLUpdateInput', () {
    test('tous les champs présents, même description vide → null', () {
      final trip = Trip(
        id: 10,
        title: 'Titre mis à jour',
        description: '',
        date: null,
        waypoints: [],
        segments: [],
      );
      final input = TripMapper.tripToGQLUpdateInput(trip);

      expect(input.title, Value.present('Titre mis à jour'));
      // description vide → Value.present(null)
      expect(input.description.isPresent, isTrue);
      expect(input.description.requireValue, isNull);
      expect(input.date, const Value.absent());
      expect(input.waypoints.isPresent, isTrue);
      expect(input.waypoints.requireValue, isEmpty);
    });
  });
}
