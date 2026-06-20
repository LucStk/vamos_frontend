import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'segment_overlay.freezed.dart';

@freezed
abstract class SegmentOverlay with _$SegmentOverlay {
  const factory SegmentOverlay({
    required List<LatLng> geometry,
    @Default(false) bool recomputing,
    Object? error,
  }) = _SegmentOverlay;
}
