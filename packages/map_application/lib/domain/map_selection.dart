import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/domain/domain.dart';

part 'map_selection.freezed.dart';

@freezed
sealed class MapSelection with _$MapSelection {
  const factory MapSelection.none() = NoSelection;
  const factory MapSelection.vertex({required VertexId vertexId}) =
      VertexSelection;
  const factory MapSelection.segment({required SegmentId segmentId}) =
      SegmentSelection;
  const factory MapSelection.cursor({required LatLng latLng}) = CursorSelection;
}

extension MapSelectionX on MapSelection {
  LatLng? get cursorLatLngOrNull => switch (this) {
    CursorSelection(:final latLng) => latLng,
    _ => null,
  };

  VertexId? get vertexIdOrNull => switch (this) {
    VertexSelection(:final vertexId) => vertexId,
    _ => null,
  };
  SegmentId? get segmentIdOrNull => switch (this) {
    SegmentSelection(:final segmentId) => segmentId,
    _ => null,
  };
}
