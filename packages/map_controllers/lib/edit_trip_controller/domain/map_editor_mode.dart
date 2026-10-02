import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:map_controllers/edit_trip_controller/edit_trip_controller.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/topology/domain/domain.dart';

part 'map_editor_mode.freezed.dart';

sealed class MapEditorMode extends BaseMode<MapEditorMode> {
  const MapEditorMode();
}

extension MapEditorModeCopy on MapEditorMode {
  MapEditorMode withPopupPosition(PopUpPositionType position) => switch (this) {
    IdleEditor m => m.copyWith(popUpPosition: position),
    SketchCreation m => m.copyWith(popUpPosition: position),
    SketchEdition m => m.copyWith(popUpPosition: position),
  };

  MapEditorMode withSelection(MapObject? selection) => switch (this) {
    IdleEditor m => m.copyWith(selection: selection),
    SketchCreation m => m.copyWith(selection: selection),
    SketchEdition m => m.copyWith(selection: selection),
  };
}

@freezed
final class IdleEditor extends MapEditorMode with _$IdleEditor {
  const IdleEditor({this.selection, this.popUpPosition});

  @override
  final PopUpPositionType popUpPosition;

  @override
  final MapObject? selection;

  @override
  ModeGestureHandler<MapEditorMode> get handler => EditTripIdleHandler(this);
}

/// Base commune : contrat partagé par SketchCreation et SketchEdition.
/// Pas de Freezed ici, donc pas de copyWith : les sous-classes l'implémentent.
sealed class SketchMode extends MapEditorMode {
  const SketchMode();

  List<LatLng> get path;
  VertexId? get touchedVertex;

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
    PopUpPositionType popUpPosition,
  }) = _SketchCreation;

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
    PopUpPositionType popUpPosition,
  }) = _SketchEdition;

  @override
  SketchEdition withPath(List<LatLng> path) => copyWith(path: path);

  @override
  ModeGestureHandler<MapEditorMode> get handler => SketchEditionHandler(this);
}
