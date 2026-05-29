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
      final seg = SegmentMapper.segmentFromGQL(gql);

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
      final seg = SegmentMapper.segmentFromGQL(gql);

      expect(seg.intermediatePoints, hasLength(2));
      expect(seg.intermediatePoints[0], const LatLng(48.0, 2.0));
      expect(seg.intermediatePoints[1], const LatLng(45.5, 3.5));
    });

    test('liste vide quand aucun point intermédiaire', () {
      final gql = GSegmentFieldsData(
        type: GSegmentTypeEnum.car,
        intermediatePoints: [],
      );
      final seg = SegmentMapper.segmentFromGQL(gql);

      expect(seg.intermediatePoints, isEmpty);
    });

    test('mappe le type train correctement', () {
      final gql = gSegmentData(type: GSegmentTypeEnum.train);
      expect(SegmentMapper.segmentFromGQL(gql).type, GSegmentTypeEnum.train);
    });

    test('les coordonnées lat/lng sont bien converties', () {
      final gql = gSegmentData(
        intermediatePoints: [
          GSegmentFieldsData_intermediatePoints(lat: 43.296, lng: 5.381),
        ],
      );
      final point = SegmentMapper.segmentFromGQL(gql).intermediatePoints.first;

      expect(point.latitude, closeTo(43.296, 0.001));
      expect(point.longitude, closeTo(5.381, 0.001));
    });
  });
}
