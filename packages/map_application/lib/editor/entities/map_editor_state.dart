import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_objects.dart';
import 'package:map_application/editor/utiles/merge_polyline.dart';
import 'package:trip_application/topology/domain/domain.dart';

part 'map_editor_state.freezed.dart';

@freezed
abstract class RouteCorrection with _$RouteCorrection {
  const factory RouteCorrection({
    required List<LatLng> path, // tracé en cours de la correction
    VertexId?
    rejoinedVertex, // renseigné si la correction a rejoint l'itinéraire original
  }) = _RouteCorrection;
}

// 2. Définition de l'Union MapMode
sealed class MapEditorState {
  const MapEditorState();
  MapObject? get selection;
}

final class Idle extends MapEditorState {
  const Idle({this.selection});
  @override
  final MapObject? selection;
}

@freezed
sealed class SketchMode extends MapEditorState with _$SketchMode {
  const SketchMode._();

  const factory SketchMode.creation({
    required VertexId vertexStart,
    required List<LatLng> itineraire,
    required MobilityType mobilityType,
    VertexId? touchedVertex,
    RouteCorrection? correction,
    MapObject? selection,
  }) = SketchCreation;

  const factory SketchMode.edition({
    required SegmentFields segment,
    VertexId? touchedVertex,
    RouteCorrection? correction,
    MapObject? selection,
  }) = SketchEdition;

  bool get hasCorrection => correction != null;
}

extension SketchX on SketchMode {
  List<LatLng>? get rawGeometry {
    switch (this) {
      case SketchCreation e:
        List<LatLng> itineraire = e.itineraire;
        if (e.correction != null) {
          itineraire = addCorrection(e.correction!.path, itineraire);
        }
        return itineraire;
      case SketchEdition e:
        return e.correction?.path;
    }
  }

  LatLng? get pencilPositionOrNull {
    switch (this) {
      case SketchCreation e:
        return e.correction?.path.last ?? e.itineraire.last;
      case SketchEdition e:
        return e.correction?.path.last;
    }
  }

  List<LatLng>? get sketchSegmentGeometryOrNull {
    switch (this) {
      case SketchCreation e:
        return e.itineraire;
      case SketchEdition e:
        return e.segment.geometry;
    }
  }
}
