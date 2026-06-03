import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'segment_vertex.freezed.dart';

@freezed
abstract class SegmentVertex with _$SegmentVertex {
  const factory SegmentVertex({required String id, required LatLng point}) =
      _SegmentVertex;
}
