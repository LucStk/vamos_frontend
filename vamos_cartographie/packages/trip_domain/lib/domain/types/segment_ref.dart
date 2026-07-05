// Dans trip_domain — type union simple
import 'package:domain_core/has_id.dart';
import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_domain/domain/entities/entities.dart';
part "segment_ref.freezed.dart";

@freezed
sealed class SegmentRef with _$SegmentRef {
  const factory SegmentRef.confirmed(Id<Segment> id) = ConfirmedSegmentRef;
  const factory SegmentRef.pending(Id<SegmentPatch> id) = PendingSegmentRef;
}
