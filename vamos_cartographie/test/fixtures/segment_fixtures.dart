import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/segments/domain/entities/segment.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

/// Construit un [GSegmentFieldsData] minimal pour les tests.
GSegmentFieldsData gSegmentData({
  GSegmentTypeEnum type = GSegmentTypeEnum.bike,
  List<GSegmentFieldsData_intermediatePoints>? intermediatePoints,
}) => GSegmentFieldsData(
  type: type,
  id: 1,
  intermediatePoints:
      intermediatePoints ??
      [GSegmentFieldsData_intermediatePoints(lat: 48.0, lng: 2.0)],
);

/// Construit un [Segment] domaine minimal pour les tests.
Segment domainSegment({
  int id = 0,
  GSegmentTypeEnum type = GSegmentTypeEnum.bike,
  List<LatLng> intermediatePoints = const [],
}) => Segment(id: id, type: type, intermediatePoints: intermediatePoints);
