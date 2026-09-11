import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_objects.dart';
import 'package:trip_application/topology/domain/domain.dart';

part 'map_editor_state.freezed.dart';

// 2. Définition de l'Union MapMode
sealed class MapEditorState {
  const MapEditorState();
  MapObject? get selection;

  MapEditorState withSelection(MapObject? selection);
}

final class Idle extends MapEditorState {
  const Idle({this.selection});
  @override
  final MapObject? selection;

  @override
  Idle withSelection(MapObject? selection) => Idle(selection: selection);
}

@freezed
sealed class SketchMode extends MapEditorState with _$SketchMode {
  const SketchMode._();

  const factory SketchMode.creation({
    required VertexId vertexStart,
    required List<LatLng> path,
    required MobilityType mobilityType,
    VertexId? touchedVertex,
    MapObject? selection,
  }) = SketchCreation;

  const factory SketchMode.edition({
    required SegmentId segmentId,
    required List<LatLng> path,
    VertexId? touchedVertex,
    MapObject? selection,
  }) = SketchEdition;

  @override
  MapObject? get selection => switch (this) {
    SketchCreation(:final selection) => selection,
    SketchEdition(:final selection) => selection,
  };

  @override
  SketchMode withSelection(MapObject? selection) => switch (this) {
    SketchCreation s => s.copyWith(selection: selection),
    SketchEdition s => s.copyWith(selection: selection),
  };
}

extension SketchX on SketchMode {
  LatLng? get pencilPositionOrNull {
    return path.last;
  }
}
