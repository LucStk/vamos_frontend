import 'package:latlong2/latlong.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/segments/data/mappers/segment_mappers.dart';
import 'package:vamos_cartographie/features/segments/domain/types/segment_type.dart';
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

      expect(seg.type, SegmentType.walk);
    });

    test('mappe les points intermédiaires en liste de SegmentVertex', () {
      final gql = gSegmentData(
        type: GSegmentTypeEnum.bike,
        geometry: [
          GSegmentFieldsData_geometry(lat: 48.0, lng: 2.0),
          GSegmentFieldsData_geometry(lat: 45.5, lng: 3.5),
        ],
      );
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.middleVertices, hasLength(2));
      expect(seg.middleVertices[0].point, const LatLng(48.0, 2.0));
      expect(seg.middleVertices[1].point, const LatLng(45.5, 3.5));
    });

    test('liste vide quand aucun point intermédiaire', () {
      final gql = GSegmentFieldsData(
        type: GSegmentTypeEnum.car,
        geometry: [],
        id: 1,
        startWaypoint: GSegmentFieldsData_startWaypoint(id: 0),
        endWaypoint: GSegmentFieldsData_endWaypoint(id: 1),
      );
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.middleVertices, isEmpty);
    });

    test('mappe le type train correctement', () {
      final gql = gSegmentData(type: GSegmentTypeEnum.train);
      expect(SegmentMapper.fromGQL(gql).type, SegmentType.train);
    });

    test('les coordonnées lat/lng sont bien converties', () {
      final gql = gSegmentData(
        geometry: [GSegmentFieldsData_geometry(lat: 43.296, lng: 5.381)],
      );
      final vertex = SegmentMapper.fromGQL(gql).middleVertices.first;

      expect(vertex.point.latitude, closeTo(43.296, 0.001));
      expect(vertex.point.longitude, closeTo(5.381, 0.001));
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

    test('segment avec plusieurs points intermédiaires', () {
      final gql = gSegmentData(
        geometry: [
          GSegmentFieldsData_geometry(lat: 48.0, lng: 2.0),
          GSegmentFieldsData_geometry(lat: 47.0, lng: 3.0),
          GSegmentFieldsData_geometry(lat: 46.0, lng: 4.0),
          GSegmentFieldsData_geometry(lat: 45.0, lng: 5.0),
        ],
      );
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.middleVertices, hasLength(4));
      expect(seg.middleVertices[0].point, const LatLng(48.0, 2.0));
      expect(seg.middleVertices[1].point, const LatLng(47.0, 3.0));
      expect(seg.middleVertices[2].point, const LatLng(46.0, 4.0));
      expect(seg.middleVertices[3].point, const LatLng(45.0, 5.0));
    });

    test('coordonnées négatives sont correctement mappées', () {
      final gql = gSegmentData(
        geometry: [GSegmentFieldsData_geometry(lat: -33.8688, lng: 151.2093)],
      );
      final vertex = SegmentMapper.fromGQL(gql).middleVertices.first;

      expect(vertex.point.latitude, closeTo(-33.8688, 0.0001));
      expect(vertex.point.longitude, closeTo(151.2093, 0.0001));
    });

    test('coordonnées avec précision décimale', () {
      final gql = gSegmentData(
        geometry: [GSegmentFieldsData_geometry(lat: 48.858370, lng: 2.294481)],
      );
      final vertex = SegmentMapper.fromGQL(gql).middleVertices.first;

      expect(vertex.point.latitude, 48.858370);
      expect(vertex.point.longitude, 2.294481);
    });

    test('l\'id du segment est correctement mappé', () {
      final gql = GSegmentFieldsData(
        id: 42,
        type: GSegmentTypeEnum.bike,
        geometry: [],
        startWaypoint: GSegmentFieldsData_startWaypoint(id: 0),
        endWaypoint: GSegmentFieldsData_endWaypoint(id: 1),
      );
      final seg = SegmentMapper.fromGQL(gql);

      expect(seg.id, 42);
    });
  });
}
