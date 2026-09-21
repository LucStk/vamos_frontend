import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/base_mode_model.dart';
import 'package:map_editor_application/application/IdleHandler.dart';
import 'package:map_editor_application/application/sketch_creation_handler.dart';
import 'package:map_editor_application/application/sketch_edition_handler.dart';
import 'package:map_engine/visual/visual.dart';
import 'package:trip_application/topology/domain/domain.dart';

part 'map_editor_mode.freezed.dart';

sealed class MapEditorMode extends BaseMode<MapEditorMode> {
  const MapEditorMode();
}

final class Idle extends MapEditorMode {
  const Idle({this.selection});

  @override
  final MapObject? selection;

  @override
  Idle withSelection(MapObject? s) => Idle(selection: s);

  @override
  ModeGestureHandler<MapEditorMode> get handler => IdleHandler(this);
}

/// Base commune : contrat partagé par SketchCreation et SketchEdition.
/// Pas de Freezed ici, donc pas de copyWith : les sous-classes l'implémentent.
sealed class SketchMode extends MapEditorMode {
  const SketchMode();

  List<LatLng> get path;
  VertexId? get touchedVertex;

  @override
  SketchMode withSelection(MapObject? selection);

  SketchMode withPath(List<LatLng> path);

  LatLng? get pencilPositionOrNull => path.isEmpty ? null : path.last;
}

@freezed
abstract class SketchCreation extends SketchMode with _$SketchCreation {
  const SketchCreation._();

  const factory SketchCreation({
    required VertexId vertexStart,
    required List<LatLng> path,
    required MobilityType mobilityType,
    VertexId? touchedVertex,
    MapObject? selection,
  }) = _SketchCreation;

  @override
  SketchCreation withSelection(MapObject? selection) =>
      copyWith(selection: selection);

  @override
  SketchCreation withPath(List<LatLng> path) => copyWith(path: path);

  @override
  ModeGestureHandler<MapEditorMode> get handler => SketchCreationHandler(this);
}

@freezed
abstract class SketchEdition extends SketchMode with _$SketchEdition {
  const SketchEdition._();

  const factory SketchEdition({
    required SegmentId segmentId,
    required List<LatLng> path,
    VertexId? touchedVertex,
    MapObject? selection,
  }) = _SketchEdition;

  @override
  SketchEdition withSelection(MapObject? selection) =>
      copyWith(selection: selection);

  @override
  SketchEdition withPath(List<LatLng> path) => copyWith(path: path);

  @override
  ModeGestureHandler<MapEditorMode> get handler => SketchEditionHandler(this);
}
