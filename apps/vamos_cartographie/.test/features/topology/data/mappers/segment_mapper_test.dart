import 'package:flutter_test/flutter_test.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/infrastructure/topology/mappers/mappers.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/domain.dart';

import 'package:topology_engine/topology_engine.dart';

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
      GMobilityType type = GMobilityType.BIKE,
      int startVertexId = 1,
      int endVertexId = 2,
      List<GLatLngFieldsData> geometry = const [],
    }) {
      return GSegmentFieldsData(
        id: id,
        mobilityType: type,
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

        expect(segment.id, Id<Segment>(10));
        expect(segment.startVertexId, Id<Vertex>(3));
        expect(segment.endVertexId, Id<Vertex>(7));
      });

      test('maps segment type via MobilityTypeMapper', () {
        final gql = buildGQLSegment(type: GMobilityType.TRAIN);

        final segment = SegmentMapper.fromGQL(gql);

        expect(segment.mobilityType, MobilityType.train);
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
          (GMobilityType.BIKE, MobilityType.bike),
          (GMobilityType.CAR, MobilityType.car),
          (GMobilityType.BOAT, MobilityType.boat),
          (GMobilityType.WALK, MobilityType.walk),
          (GMobilityType.TRAIN, MobilityType.train),
        ];

        for (final (gqlType, domainType) in types) {
          final gql = buildGQLSegment(type: gqlType);
          final segment = SegmentMapper.fromGQL(gql);
          expect(
            segment.mobilityType,
            domainType,
            reason: 'type $gqlType should map to $domainType',
          );
        }
      });
    });
  });
}
