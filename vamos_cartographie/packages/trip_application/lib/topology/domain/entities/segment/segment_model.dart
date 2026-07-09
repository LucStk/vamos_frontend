import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import '/topology/domain/value_objects/mobility_types.dart';
import "/topology/domain/entities/vertex/vertex.dart";
part 'segment_model.freezed.dart';

@freezed
abstract class Segment with _$Segment implements HasId {
  const factory Segment({
    required Id<Segment> id,
    required Id<Vertex> startVertexId,
    required Id<Vertex> endVertexId,
    required List<LatLng> geometry,
    @Default(MobilityType.bike) MobilityType mobilityType,
  }) = _Segment;

  const Segment._();
}

typedef SegmentId = Id<Segment>;
