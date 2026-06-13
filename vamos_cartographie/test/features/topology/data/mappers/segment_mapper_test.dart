import 'package:flutter_test/flutter_test.dart';
import 'package:vamos_cartographie/features/topology/data/mappers/segment_mappers.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';

import 'package:vamos_cartographie/backend/backend.dart';

void main() {
  group('SegmentMapper', () {
    // ---------------------------------------------------------------------------
    // Helpers
    // ---------------------------------------------------------------------------

    GVertexFieldsData buildVertex(
      int id, {
      double lat = 0.0,
      double lng = 0.0,
    }) {
      return GVertexFieldsData(
        id: id,
        latLng: GLatLngFieldsData(lat: lat, lng: lng),
      );
    }

    GSegmentFieldsData buildGQLSegment({
      int id = 10,
      GSegmentTypeEnum type = GSegmentTypeEnum.bike,
      int startVertexId = 1,
      int endVertexId = 2,
      List<GLatLngFieldsData> geometry = const [],
    }) {
      return GSegmentFieldsData(
        id: id,
        type: type,
        startVertex: buildVertex(startVertexId, lat: 48.0, lng: 2.0),
        endVertex: buildVertex(endVertexId, lat: 48.1, lng: 2.1),
        geometry: geometry,
      );
    }

    // ---------------------------------------------------------------------------
    // fromGQL
    // ---------------------------------------------------------------------------

    group('fromGQL', () {
      // Given a GSegmentFieldsData from the GQL layer
      // When fromGQL is called
      // Then a Segment with all fields correctly mapped is returned

      test('maps id, startVertexId and endVertexId', () {
        final gql = buildGQLSegment(id: 10, startVertexId: 3, endVertexId: 7);

        final segment = SegmentMapper.fromGQL(gql);

        expect(segment.id, 10);
        expect(segment.startVertexId, 3);
        expect(segment.endVertexId, 7);
      });

      test('maps segment type via SegmentTypeMapper', () {
        final gql = buildGQLSegment(type: GSegmentTypeEnum.train);

        final segment = SegmentMapper.fromGQL(gql);

        expect(segment.type, SegmentType.train);
      });

      test('maps empty geometry list', () {
        final gql = buildGQLSegment(geometry: []);

        final segment = SegmentMapper.fromGQL(gql);

        expect(segment.geometry, isEmpty);
      });

      test('maps a single geometry point', () {
        final gql = buildGQLSegment(
          geometry: [GLatLngFieldsData(lat: 48.5, lng: 2.3)],
        );

        final segment = SegmentMapper.fromGQL(gql);

        expect(segment.geometry, hasLength(1));
        expect(segment.geometry.first.latitude, 48.5);
        expect(segment.geometry.first.longitude, 2.3);
      });

      test('maps multiple geometry points preserving order', () {
        final gql = buildGQLSegment(
          geometry: [
            GLatLngFieldsData(lat: 48.0, lng: 2.0),
            GLatLngFieldsData(lat: 48.5, lng: 2.5),
            GLatLngFieldsData(lat: 49.0, lng: 3.0),
          ],
        );

        final segment = SegmentMapper.fromGQL(gql);

        expect(segment.geometry, hasLength(3));
        expect(segment.geometry[0].latitude, 48.0);
        expect(segment.geometry[1].latitude, 48.5);
        expect(segment.geometry[2].latitude, 49.0);
      });

      test('maps all segment types correctly', () {
        final types = [
          (GSegmentTypeEnum.bike, SegmentType.bike),
          (GSegmentTypeEnum.car, SegmentType.car),
          (GSegmentTypeEnum.boat, SegmentType.boat),
          (GSegmentTypeEnum.walk, SegmentType.walk),
          (GSegmentTypeEnum.train, SegmentType.train),
        ];

        for (final (gqlType, domainType) in types) {
          final gql = buildGQLSegment(type: gqlType);
          final segment = SegmentMapper.fromGQL(gql);
          expect(
            segment.type,
            domainType,
            reason: 'type $gqlType should map to $domainType',
          );
        }
      });
    });
  });
}
