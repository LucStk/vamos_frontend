import 'package:test/test.dart';
import 'package:vamos_cartographie/features/segments/data/mappers/segment_mappers.dart';
import 'package:vamos_cartographie/features/segments/domain/types/segment_type.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../../../fixtures/segment_fixtures.dart';

void main() {
  // ---------------------------------------------------------------------------
  // SegmentMapper.fromGQL — GQL → Domaine
  // ---------------------------------------------------------------------------

  group('SegmentMapper.fromGQL', () {
    test('mappe le type correctement', () {
      final gql = gSegmentData(type: GSegmentTypeEnum.walk);
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.type, SegmentType.walk);
    });

    test('mappe les IDs des vertex de départ et de fin', () {
      final gql = gSegmentData(startVertexId: 10, endVertexId: 20);
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.startVertexId, 10);
      expect(seg.endVertexId, 20);
    });

    test('mappe le type train correctement', () {
      final gql = gSegmentData(type: GSegmentTypeEnum.train);
      expect(SegmentMapper.fromGQL(gql).type, SegmentType.train);
    });

    test('mappe tous les types de segment disponibles', () {
      final gqlTypes = [
        GSegmentTypeEnum.bike,
        GSegmentTypeEnum.walk,
        GSegmentTypeEnum.car,
        GSegmentTypeEnum.train,
        GSegmentTypeEnum.boat,
      ];
      final domainTypes = [
        SegmentType.bike,
        SegmentType.walk,
        SegmentType.car,
        SegmentType.train,
        SegmentType.boat,
      ];

      for (var i = 0; i < gqlTypes.length; i++) {
        final gql = gSegmentData(type: gqlTypes[i]);
        final seg = SegmentMapper.fromGQL(gql);
        expect(
          seg.type,
          domainTypes[i],
          reason: 'Type ${gqlTypes[i]} devrait être mappé',
        );
      }
    });

    test('l\'id du segment est correctement mappé', () {
      final gql = gSegmentData(id: 42);
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.id, 42);
    });

    test('mappe correctement les vertex avec leurs coordonnées', () {
      final gql = GSegmentFieldsData(
        id: 1,
        type: GSegmentTypeEnum.bike,
        startVertex: GVertexFieldsData(
          id: 100,
          latLng: GLatLngFieldsData(lat: 48.8566, lng: 2.3522),
        ),
        endVertex: GVertexFieldsData(
          id: 200,
          latLng: GLatLngFieldsData(lat: 48.8606, lng: 2.3376),
        ),
      );
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.startVertexId, 100);
      expect(seg.endVertexId, 200);
    });

    test('segment avec type car', () {
      final gql = gSegmentData(type: GSegmentTypeEnum.car);
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.type, SegmentType.car);
    });

    test('segment avec différents IDs de vertex', () {
      final gql = gSegmentData(startVertexId: 5, endVertexId: 15);
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.startVertexId, 5);
      expect(seg.endVertexId, 15);
    });
  });
}
