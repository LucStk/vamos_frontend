import 'package:latlong2/latlong.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/trips/data/mappers/trip_mappers.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../../../fixtures/trip_fixtures.dart';

void main() {
  // ---------------------------------------------------------------------------
  // TripMapper.fromGQLFields — GQL → Domaine (fragment de liste)
  // ---------------------------------------------------------------------------

  group('TripMapper.fromGQLFields', () {
    test('convertit l\'id, le titre, la description et la date', () {
      final trip = TripMapper.fromGQLFields(gTripFieldsData(id: 5));

      expect(trip.id, 5);
      expect(trip.title, 'Tour de test');
      expect(trip.description, 'Une belle aventure');
      expect(trip.date, DateTime(2024, 7, 14));
    });

    test('convertit les images correctement', () {
      final trip = TripMapper.fromGQLFields(gTripFieldsData());

      expect(trip.images, hasLength(1));
      expect(trip.images.first.fileKey, kTestFileKey);
      expect(trip.images.first.url, kTestImageUrl);
    });

    test('mappe plusieurs images', () {
      final gql = gTripFieldsData(
        images: [
          GTripFieldsData_images(
            image: gImageData(fileKey: 'media/a.jpg', url: 'https://cdn/a.jpg'),
          ),
          GTripFieldsData_images(
            image: gImageData(fileKey: 'media/b.jpg', url: 'https://cdn/b.jpg'),
          ),
        ],
      );
      final images = TripMapper.fromGQLFields(gql).images;

      expect(images, hasLength(2));
      expect(images[0].fileKey, 'media/a.jpg');
      expect(images[1].fileKey, 'media/b.jpg');
    });

    test('date null si absente du fragment', () {
      final gql = gTripFieldsData(date: null, images: []);
      expect(TripMapper.fromGQLFields(gql).date, isNull);
    });

    test('waypoints et segments sont vides (fragment de liste)', () {
      final trip = TripMapper.fromGQLFields(gTripFieldsData());

      expect(trip.waypoints, isEmpty);
      expect(trip.segments, isEmpty);
    });
  });

  // ---------------------------------------------------------------------------
  // TripMapper.fromGQLDetail — GQL → Domaine (query détaillée)
  // ---------------------------------------------------------------------------

  group('TripMapper.fromGQLDetail', () {
    test('inclut les waypoints et les segments', () {
      final trip = TripMapper.fromGQLDetail(gTripDetailData(id: 3));

      expect(trip.id, 3);
      expect(trip.waypoints, hasLength(2));
      expect(trip.segments, hasLength(1));
    });

    test('waypoint bien mappé — coordonnées et type', () {
      final trip = TripMapper.fromGQLDetail(gTripDetailData());
      final wp = trip.waypoints.first;

      expect(wp.id, 1);
      expect(wp.latLng, const LatLng(48.85, 2.35));
      expect(wp.type, GWaypointEnum.WAYPOINT);
    });

    test('segment bien mappé — type et point intermédiaire', () {
      final trip = TripMapper.fromGQLDetail(gTripDetailData());
      final seg = trip.segments.first;

      expect(seg.type, GSegmentTypeEnum.bike);
      expect(seg.intermediatePoints, [const LatLng(48.0, 2.0)]);
    });

    test('images du trip bien mappées', () {
      final trip = TripMapper.fromGQLDetail(gTripDetailData());

      expect(trip.images, hasLength(1));
      expect(
        trip.images.first,
        MediaImage(fileKey: kTestFileKey, url: kTestImageUrl),
      );
    });

    test('date null si absente', () {
      final trip = TripMapper.fromGQLDetail(
        gTripDetailData(date: null, waypoints: [], segments: []),
      );
      expect(trip.date, isNull);
    });

    test('date parsée correctement', () {
      final trip = TripMapper.fromGQLDetail(
        gTripDetailData(date: '2024-07-14'),
      );
      expect(trip.date, DateTime(2024, 7, 14));
    });
  });

  // ---------------------------------------------------------------------------
  // TripMapper.fromGQLCreateResult — mutation createTrip
  //
  // Le résultat de createTrip (GCreateTripData.createTrip) est un GTripFieldsData
  // qui implémente l'interface GTripFields.
  // Le fragment TripFields NE contient PAS de waypoints ni segments.
  // ---------------------------------------------------------------------------

  group('TripMapper.fromGQLCreateResult', () {
    test('convertit l\'id, le titre, la description', () {
      final trip = TripMapper.fromGQLCreateResult(gCreateTripResult(id: 42));

      expect(trip.id, 42);
      expect(trip.title, 'Nouveau trip');
      expect(trip.description, 'Créé via mutation');
    });

    test('date null si absente du résultat de création', () {
      final trip = TripMapper.fromGQLCreateResult(
        gCreateTripResult(date: null),
      );
      expect(trip.date, isNull);
    });

    test('mappe les images du résultat de création', () {
      final trip = TripMapper.fromGQLCreateResult(gCreateTripResult());

      expect(trip.images, hasLength(1));
      expect(trip.images.first.fileKey, kTestFileKey);
    });

    test('waypoints et segments sont vides (GTripFields sans waypoints)', () {
      final trip = TripMapper.fromGQLCreateResult(gCreateTripResult());

      expect(trip.waypoints, isEmpty);
      expect(trip.segments, isEmpty);
    });
  });

  // ---------------------------------------------------------------------------
  // TripMapper.fromGQLUpdateResult — mutation updateTrip
  //
  // Même remarque que pour fromGQLCreateResult : GTripFieldsData est retourné,
  // sans waypoints ni segments.
  // ---------------------------------------------------------------------------

  group('TripMapper.fromGQLUpdateResult', () {
    test('convertit correctement le résultat de mise à jour', () {
      final trip = TripMapper.fromGQLUpdateResult(gUpdateTripResult(id: 7));

      expect(trip.id, 7);
      expect(trip.title, 'Trip modifié');
      expect(trip.description, 'Mis à jour');
      expect(trip.date, DateTime(2024, 8, 1));
    });

    test('mappe les images du résultat de mise à jour', () {
      final trip = TripMapper.fromGQLUpdateResult(gUpdateTripResult());

      expect(trip.images, hasLength(1));
      expect(trip.images.first.fileKey, kTestFileKey);
    });

    test('date null si absente du résultat de mise à jour', () {
      final trip = TripMapper.fromGQLUpdateResult(
        gUpdateTripResult(date: null, images: []),
      );
      expect(trip.date, isNull);
    });

    test('waypoints et segments sont vides (GTripFields sans waypoints)', () {
      final trip = TripMapper.fromGQLUpdateResult(gUpdateTripResult());

      expect(trip.waypoints, isEmpty);
      expect(trip.segments, isEmpty);
    });
  });
}
