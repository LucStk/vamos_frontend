import 'package:topology_engine/domain/types/geometry.dart';

class SegmentViewModel {
  final Geometry geometry;
  final Geometry mobilityMarker;
  final bool isOptimistic;
  SegmentViewModel({
    required this.geometry,
    required this.mobilityMarker,
    required this.isOptimistic,
  });
}
