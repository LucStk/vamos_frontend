import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/features.dart';
part "display_segment.freezed.dart";

@freezed
abstract class DisplaySegment with _$DisplaySegment {
  const factory DisplaySegment({
    required Segment segment,
    required List<LatLng> geometry,
  }) = _DisplaySegment;
}
