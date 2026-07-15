import 'package:flutter_test/flutter_test.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/domain/trip.dart';
import 'package:vamos_cartographie/backend/backend.dart';
import 'package:vamos_cartographie/infrastructure/trip/mappers/mappers.dart';

void main() {
  group('TripMapper', () {
    // ---------------------------------------------------------------------------
    // Helpers
    // ---------------------------------------------------------------------------

    GTripFieldsData buildGQLTrip({
      int id = 1,
      String title = 'Tour de Bretagne',
      String description = 'Un tour à vélo',
      String? date = '2024-07-15',
      List<GTripFieldsData_images> images = const [],
    }) {
      return GTripFieldsData(
        id: id,
        title: title,
        description: description,
        date: date,
        images: images,
      );
    }

    GTripFieldsData_images buildGQLImage({
      String url = 'https://example.com/img.jpg',
      String fileKey = 'key-1',
    }) {
      return GTripFieldsData_images(
        image: GImageFieldsData(url: url, fileKey: fileKey),
      );
    }

    // ---------------------------------------------------------------------------
    // fromGQLFields
    // ---------------------------------------------------------------------------

    group('fromGQLFields', () {
      // Given valid GQL data
      // When fromGQLFields is called
      // Then all domain fields are correctly mapped

      test('maps id, title and description', () {
        final gql = buildGQLTrip(
          id: 42,
          title: 'Bretagne',
          description: 'Côte sauvage',
        );

        final trip = TripMapper.fromGQLFields(gql);

        expect(trip.id, Id<Trip>(42));
        expect(trip.title, 'Bretagne');
        expect(trip.description, 'Côte sauvage');
      });

      test('parses date string to DateTime', () {
        final gql = buildGQLTrip(date: '2024-07-15');

        final trip = TripMapper.fromGQLFields(gql);

        expect(trip.date, DateTime(2024, 7, 15));
      });

      test('maps null date to null', () {
        final gql = buildGQLTrip(date: null);

        final trip = TripMapper.fromGQLFields(gql);

        expect(trip.date, isNull);
      });

      test('maps empty image list', () {
        final gql = buildGQLTrip(images: []);

        final trip = TripMapper.fromGQLFields(gql);

        expect(trip.images, isEmpty);
      });

      test('maps a single image with url and fileKey', () {
        final gql = buildGQLTrip(
          images: [
            buildGQLImage(
              url: 'https://cdn.example.com/photo.jpg',
              fileKey: 'photos/abc',
            ),
          ],
        );

        final trip = TripMapper.fromGQLFields(gql);

        expect(trip.images, hasLength(1));
        expect(trip.images.first.url, 'https://cdn.example.com/photo.jpg');
        expect(trip.images.first.fileKey, 'photos/abc');
      });

      test('maps multiple images preserving order', () {
        final gql = buildGQLTrip(
          images: [
            buildGQLImage(url: 'https://example.com/a.jpg', fileKey: 'key-a'),
            buildGQLImage(url: 'https://example.com/b.jpg', fileKey: 'key-b'),
            buildGQLImage(url: 'https://example.com/c.jpg', fileKey: 'key-c'),
          ],
        );

        final trip = TripMapper.fromGQLFields(gql);

        expect(trip.images, hasLength(3));
        expect(trip.images[0].fileKey, 'key-a');
        expect(trip.images[1].fileKey, 'key-b');
        expect(trip.images[2].fileKey, 'key-c');
      });
    });

    // ---------------------------------------------------------------------------
    // fromGQLCreateResult
    // ---------------------------------------------------------------------------

    group('fromGQLCreateResult', () {
      // Given the result of a createTrip mutation
      // When fromGQLCreateResult is called
      // Then the domain Trip reflects the server-confirmed values

      test('maps trip returned by createTrip mutation', () {
        final gql = buildGQLTrip(
          id: 99,
          title: 'Nouveau voyage',
          date: '2025-01-01',
        );

        final trip = TripMapper.fromGQLCreateResult(gql);

        expect(trip.id, Id<Trip>(99));
        expect(trip.title, 'Nouveau voyage');
        expect(trip.date, DateTime(2025, 1, 1));
      });

      test('maps trip without date from createTrip mutation', () {
        final gql = buildGQLTrip(id: 10, title: 'Sans date', date: null);

        final trip = TripMapper.fromGQLCreateResult(gql);

        expect(trip.date, isNull);
      });
    });

    // ---------------------------------------------------------------------------
    // fromGQLUpdateResult
    // ---------------------------------------------------------------------------

    group('fromGQLUpdateResult', () {
      // Given the result of an updateTrip mutation
      // When fromGQLUpdateResult is called
      // Then the domain Trip reflects the updated server-confirmed values

      test('maps updated fields from updateTrip mutation', () {
        final gql = buildGQLTrip(
          id: 7,
          title: 'Voyage modifié',
          description: 'Nouvelle description',
        );

        final trip = TripMapper.fromGQLUpdateResult(gql);

        expect(trip.id, Id<Trip>(7));
        expect(trip.title, 'Voyage modifié');
        expect(trip.description, 'Nouvelle description');
      });

      test('maps null date from updateTrip mutation', () {
        final gql = buildGQLTrip(id: 7, date: null);

        final trip = TripMapper.fromGQLUpdateResult(gql);

        expect(trip.date, isNull);
      });
    });
  });
}
