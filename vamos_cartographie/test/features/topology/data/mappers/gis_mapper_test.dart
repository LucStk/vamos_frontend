import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/shared/shared.dart';
import 'package:vamos_cartographie/graphql/shared/__generated__/geo_fields.data.gql.dart';

void main() {
  group('GisMapper', () {
    // ---------------------------------------------------------------------------
    // GLatLngFields → LatLng  (fromGQL)
    // ---------------------------------------------------------------------------

    group('fromGQL', () {
      // Given a GLatLngFieldsData from the GQL layer
      // When fromGQL is called
      // Then a LatLng with the correct coordinates is returned

      test('maps lat and lng to LatLng', () {
        final data = GLatLngFieldsData(lat: 48.8566, lng: 2.3522);

        final result = GisMapper.fromGQL(data);

        expect(result.latitude, 48.8566);
        expect(result.longitude, 2.3522);
      });

      test('maps negative coordinates (hémisphère sud et ouest)', () {
        final data = GLatLngFieldsData(lat: -33.8688, lng: -70.6693);

        final result = GisMapper.fromGQL(data);

        expect(result.latitude, -33.8688);
        expect(result.longitude, -70.6693);
      });

      test('maps zero coordinates', () {
        final data = GLatLngFieldsData(lat: 0.0, lng: 0.0);

        final result = GisMapper.fromGQL(data);

        expect(result.latitude, 0.0);
        expect(result.longitude, 0.0);
      });

      test('preserves decimal precision', () {
        final data = GLatLngFieldsData(lat: 43.123456789, lng: 1.987654321);

        final result = GisMapper.fromGQL(data);

        expect(result.latitude, 43.123456789);
        expect(result.longitude, 1.987654321);
      });
    });

    // ---------------------------------------------------------------------------
    // LatLng → GLatLngInput  (toGQL)
    // ---------------------------------------------------------------------------

    group('toGQL', () {
      // Given a LatLng
      // When toGQL is called
      // Then a GLatLngInput with the correct lat/lng is returned

      test('maps latitude and longitude to GLatLngInput', () {
        final latLng = LatLng(48.8566, 2.3522);

        final result = GisMapper.toGQL(latLng);

        expect(result.lat, 48.8566);
        expect(result.lng, 2.3522);
      });

      test('maps negative coordinates', () {
        final latLng = LatLng(-33.8688, -70.6693);

        final result = GisMapper.toGQL(latLng);

        expect(result.lat, -33.8688);
        expect(result.lng, -70.6693);
      });

      test(
        'round-trip: toGQL then fromGQL returns the original coordinates',
        () {
          // Given a LatLng
          // When converted to GQL and back
          // Then the coordinates are preserved
          final original = LatLng(44.8378, -0.5792);

          final roundTrip = GisMapper.fromGQL(
            GLatLngFieldsData(
              lat: GisMapper.toGQL(original).lat,
              lng: GisMapper.toGQL(original).lng,
            ),
          );

          expect(roundTrip.latitude, original.latitude);
          expect(roundTrip.longitude, original.longitude);
        },
      );
    });
  });
}
