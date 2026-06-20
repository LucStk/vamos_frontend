import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'segment_patch.freezed.dart';

@freezed
abstract class SegmentPatch with _$SegmentPatch {
  const factory SegmentPatch({
    required List<LatLng> geometryOverride,
    @Default(false) bool recomputing,
    Object? error,
  }) = _SegmentPatch;
}
