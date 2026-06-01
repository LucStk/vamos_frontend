import 'package:latlong2/latlong.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/segments/data/mappers/segment_mappers.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../../../fixtures/segment_fixtures.dart';

void main() {
  // ---------------------------------------------------------------------------
  // SegmentMapper.segmentFromGQL — GQL → Domaine
  // ---------------------------------------------------------------------------

  group('SegmentMapper.segmentFromGQL', () {
    test('mappe le type correctement', () {
      final gql = gSegmentData(type: GSegmentTypeEnum.walk);
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.type, GSegmentTypeEnum.walk);
    });

    test('mappe les points intermédiaires en liste de LatLng', () {
      final gql = gSegmentData(
        type: GSegmentTypeEnum.bike,
        intermediatePoints: [
          GSegmentFieldsData_intermediatePoints(lat: 48.0, lng: 2.0),
          GSegmentFieldsData_intermediatePoints(lat: 45.5, lng: 3.5),
        ],
      );
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.intermediatePoints, hasLength(2));
      expect(seg.intermediatePoints[0], const LatLng(48.0, 2.0));
      expect(seg.intermediatePoints[1], const LatLng(45.5, 3.5));
    });

    test('liste vide quand aucun point intermédiaire', () {
      final gql = GSegmentFieldsData(
        type: GSegmentTypeEnum.car,
        intermediatePoints: [],
        id: 1,
      );
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.intermediatePoints, isEmpty);
    });

    test('mappe le type train correctement', () {
      final gql = gSegmentData(type: GSegmentTypeEnum.train);
      expect(SegmentMapper.fromGQL(gql).type, GSegmentTypeEnum.train);
    });

    test('les coordonnées lat/lng sont bien converties', () {
      final gql = gSegmentData(
        intermediatePoints: [
          GSegmentFieldsData_intermediatePoints(lat: 43.296, lng: 5.381),
        ],
      );
      final point = SegmentMapper.fromGQL(gql).intermediatePoints.first;

      expect(point.latitude, closeTo(43.296, 0.001));
      expect(point.longitude, closeTo(5.381, 0.001));
    });

    test('mappe tous les types de segment disponibles', () {
      final types = [
        GSegmentTypeEnum.bike,
        GSegmentTypeEnum.walk,
        GSegmentTypeEnum.car,
        GSegmentTypeEnum.train,
        GSegmentTypeEnum.boat,
      ];

      for (final type in types) {
        final gql = gSegmentData(type: type);
        final seg = SegmentMapper.fromGQL(gql);
        expect(seg.type, type, reason: 'Type $type devrait être mappé');
      }
    });

    test('segment avec plusieurs points intermédiaires', () {
      final gql = gSegmentData(
        intermediatePoints: [
          GSegmentFieldsData_intermediatePoints(lat: 48.0, lng: 2.0),
          GSegmentFieldsData_intermediatePoints(lat: 47.0, lng: 3.0),
          GSegmentFieldsData_intermediatePoints(lat: 46.0, lng: 4.0),
          GSegmentFieldsData_intermediatePoints(lat: 45.0, lng: 5.0),
        ],
      );
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.intermediatePoints, hasLength(4));
      expect(seg.intermediatePoints[0], const LatLng(48.0, 2.0));
      expect(seg.intermediatePoints[1], const LatLng(47.0, 3.0));
      expect(seg.intermediatePoints[2], const LatLng(46.0, 4.0));
      expect(seg.intermediatePoints[3], const LatLng(45.0, 5.0));
    });

    test('coordonnées négatives sont correctement mappées', () {
      final gql = gSegmentData(
        intermediatePoints: [
          GSegmentFieldsData_intermediatePoints(lat: -33.8688, lng: 151.2093),
        ],
      );
      final point = SegmentMapper.fromGQL(gql).intermediatePoints.first;

      expect(point.latitude, closeTo(-33.8688, 0.0001));
      expect(point.longitude, closeTo(151.2093, 0.0001));
    });

    test('coordonnées avec précision décimale', () {
      final gql = gSegmentData(
        intermediatePoints: [
          GSegmentFieldsData_intermediatePoints(lat: 48.858370, lng: 2.294481),
        ],
      );
      final point = SegmentMapper.fromGQL(gql).intermediatePoints.first;

      expect(point.latitude, 48.858370);
      expect(point.longitude, 2.294481);
    });

    test('l\'id du segment est correctement mappé', () {
      final gql = GSegmentFieldsData(
        id: 42,
        type: GSegmentTypeEnum.bike,
        intermediatePoints: [],
      );
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.id, 42);
    });
  });
}
