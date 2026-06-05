import 'package:vamos_cartographie/features/segments/domain/domain.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

/// Construit un [GSegmentFieldsData] minimal pour les tests.
GSegmentFieldsData gSegmentData({
  int id = 1,
  int startVertexId = 1,
  int endVertexId = 2,
  GSegmentTypeEnum type = GSegmentTypeEnum.bike,
}) => GSegmentFieldsData(
  id: id,
  type: type,
  startVertex: GVertexFieldsData(
    id: startVertexId,
    latLng: GLatLngFieldsData(lat: 48.85, lng: 2.35),
  ),
  endVertex: GVertexFieldsData(
    id: endVertexId,
    latLng: GLatLngFieldsData(lat: 48.86, lng: 2.36),
  ),
);

/// Construit un [Segment] domaine minimal pour les tests.
Segment domainSegment({
  int id = 0,
  SegmentType type = SegmentType.bike,
  List<SegmentVertex> middleVertices = const [],
}) => Segment(
  id: id,
  type: type,
  middleVertices: middleVertices,
  startWaypointId: 1,
  endWaypointId: 2,
);
