import 'package:latlong2/latlong.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/trips/data/mappers/trip_mappers.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/segments/domain/types/segment_type.dart';
import 'package:vamos_cartographie/features/waypoints/domain/types/waypoint_type.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../../../fixtures/trip_fixtures.dart';
import '../../../fixtures/segment_fixtures.dart';

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

    test('liste d\'images vide si aucune image', () {
      final trip = TripMapper.fromGQLFields(gTripFieldsData(images: []));

      expect(trip.images, isEmpty);
    });

    test('gestion de plusieurs trips avec des ids différents', () {
      final trip1 = TripMapper.fromGQLFields(gTripFieldsData(id: 10));
      final trip2 = TripMapper.fromGQLFields(gTripFieldsData(id: 20));

      expect(trip1.id, 10);
      expect(trip2.id, 20);
      expect(trip1.id, isNot(equals(trip2.id)));
    });

    test('description vide est correctement mappée', () {
      final trip = TripMapper.fromGQLFields(gTripFieldsData(description: ''));

      expect(trip.description, '');
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
      expect(wp.type, WaypointType.waypoint);
    });

    test('tous les waypoints sont bien mappés', () {
      final trip = TripMapper.fromGQLDetail(gTripDetailData());

      expect(trip.waypoints[0].id, 1);
      expect(trip.waypoints[0].latLng, const LatLng(48.85, 2.35));
      expect(trip.waypoints[1].id, 2);
      expect(trip.waypoints[1].latLng, const LatLng(48.85, 2.35));
    });

    test('segment bien mappé — type et vertex IDs', () {
      final trip = TripMapper.fromGQLDetail(gTripDetailData());
      final seg = trip.segments.first;

      expect(seg.type, SegmentType.bike);
      expect(seg.startWaypointId, 1);
      expect(seg.endWaypointId, 2);
      expect(seg.middleVertices, isEmpty);
    });

    test('plusieurs segments sont correctement mappés', () {
      final trip = TripMapper.fromGQLDetail(
        gTripDetailData(
          segments: [
            gSegmentData(
              id: 1,
              startVertexId: 1,
              endVertexId: 2,
              type: GSegmentTypeEnum.bike,
            ),
            gSegmentData(
              id: 2,
              startVertexId: 2,
              endVertexId: 3,
              type: GSegmentTypeEnum.walk,
            ),
            gSegmentData(
              id: 3,
              startVertexId: 3,
              endVertexId: 4,
              type: GSegmentTypeEnum.car,
            ),
          ],
        ),
      );

      expect(trip.segments, hasLength(3));
      expect(trip.segments[0].type, SegmentType.bike);
      expect(trip.segments[1].type, SegmentType.walk);
      expect(trip.segments[2].type, SegmentType.car);
    });

    test('segment sans points intermédiaires', () {
      final trip = TripMapper.fromGQLDetail(
        gTripDetailData(segments: [gSegmentData()]),
      );

      expect(trip.segments.first.middleVertices, isEmpty);
    });

    test('waypoints et segments vides si absents', () {
      final trip = TripMapper.fromGQLDetail(
        gTripDetailData(waypoints: [], segments: []),
      );

      expect(trip.waypoints, isEmpty);
      expect(trip.segments, isEmpty);
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

    test('différentes dates sont parsées correctement', () {
      final trip1 = TripMapper.fromGQLDetail(
        gTripDetailData(date: '2025-01-01'),
      );
      final trip2 = TripMapper.fromGQLDetail(
        gTripDetailData(date: '2023-12-31'),
      );

      expect(trip1.date, DateTime(2025, 1, 1));
      expect(trip2.date, DateTime(2023, 12, 31));
    });

    test('titre et description sont correctement mappés', () {
      final trip = TripMapper.fromGQLDetail(
        gTripDetailData(
          title: 'Voyage extraordinaire',
          description: 'Une description détaillée',
        ),
      );

      expect(trip.title, 'Voyage extraordinaire');
      expect(trip.description, 'Une description détaillée');
    });

    test('gestion des caractères spéciaux dans le titre', () {
      final trip = TripMapper.fromGQLDetail(
        gTripDetailData(title: 'Trip avec éàçù & spéciaux'),
      );

      expect(trip.title, 'Trip avec éàçù & spéciaux');
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

    test('plusieurs images sont correctement mappées', () {
      final trip = TripMapper.fromGQLCreateResult(
        gCreateTripResult(
          images: [
            GTripFieldsData_images(
              image: gImageData(fileKey: 'media/img1.jpg'),
            ),
            GTripFieldsData_images(
              image: gImageData(fileKey: 'media/img2.jpg'),
            ),
          ],
        ),
      );

      expect(trip.images, hasLength(2));
      expect(trip.images[0].fileKey, 'media/img1.jpg');
      expect(trip.images[1].fileKey, 'media/img2.jpg');
    });

    test('date avec différents formats', () {
      final trip = TripMapper.fromGQLCreateResult(
        gCreateTripResult(date: '2024-12-25'),
      );

      expect(trip.date, DateTime(2024, 12, 25));
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

    test('liste d\'images vide si aucune image', () {
      final trip = TripMapper.fromGQLUpdateResult(
        gUpdateTripResult(images: []),
      );

      expect(trip.images, isEmpty);
    });

    test('modification du titre conserve les autres champs', () {
      final trip = TripMapper.fromGQLUpdateResult(
        gUpdateTripResult(
          id: 99,
          title: 'Nouveau titre',
          description: 'Ancienne description',
        ),
      );

      expect(trip.id, 99);
      expect(trip.title, 'Nouveau titre');
      expect(trip.description, 'Ancienne description');
    });

    test('plusieurs images dans le résultat de mise à jour', () {
      final trip = TripMapper.fromGQLUpdateResult(
        gUpdateTripResult(
          images: [
            GTripFieldsData_images(
              image: gImageData(fileKey: 'media/a.jpg', url: 'https://a.jpg'),
            ),
            GTripFieldsData_images(
              image: gImageData(fileKey: 'media/b.jpg', url: 'https://b.jpg'),
            ),
            GTripFieldsData_images(
              image: gImageData(fileKey: 'media/c.jpg', url: 'https://c.jpg'),
            ),
          ],
        ),
      );

      expect(trip.images, hasLength(3));
      expect(trip.images[0].fileKey, 'media/a.jpg');
      expect(trip.images[1].fileKey, 'media/b.jpg');
      expect(trip.images[2].fileKey, 'media/c.jpg');
    });
  });
}
