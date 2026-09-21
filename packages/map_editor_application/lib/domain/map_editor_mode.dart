import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/domain.dart';
import 'package:map_engine/visual/visual.dart';
import 'package:trip_application/topology/domain/domain.dart';

part 'map_editor_mode.freezed.dart';

sealed class MapEditorMode extends BaseMode {
  const MapEditorMode();

  @override
  MapObject? get selection;

  MapEditorMode withSelection(MapObject? selection);
}

class Idle extends MapEditorMode {
  const Idle({MapObject? selection});

  @override
  Idle withSelection(MapObject? selection) {
    return Idle(selection: selection);
  }
}

@freezed
sealed class SketchMode extends MapEditorMode with _$SketchMode {
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
    SketchCreation mode => mode.copyWith(selection: selection),
    SketchEdition mode => mode.copyWith(selection: selection),
  };
}

extension SketchX on SketchMode {
  LatLng? get pencilPositionOrNull {
    if (path.isEmpty) return null;
    return path.last;
  }
}
