import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/domain/domain.dart';

part 'map_mode.freezed.dart';

@freezed
sealed class RouteCorrection with _$RouteCorrection {
  const factory RouteCorrection({
    required LatLng grabPoint, // point sur le tracé où le grab a commencé
    required List<LatLng> path, // tracé en cours de la correction
    VertexId?
    rejoinedVertex, // renseigné si la correction a rejoint l'itinéraire original
  }) = _RouteCorrection;
}

@freezed
sealed class MapMode with _$MapMode {
  const factory MapMode.idle() = Idle;
  const factory MapMode.sketchMode({
    required VertexId vertexStart,
    required List<LatLng> itineraire,
    required MobilityType mobilityType,
    VertexId? touchedVertex,
    RouteCorrection? correction, // null = pas de grab en cours
  }) = Sketch;
  const factory MapMode.segmentEditMode({
    required SegmentId segmentId,
    required List<LatLng> originalItineraire,
    RouteCorrection? correction,
  }) = SegmentEdit;
}

extension SketchX on MapMode {
  LatLng? get pencilPositionOrNull {
    switch (this) {
      case Sketch e:
        return e.correction?.path.last ?? e.itineraire.last;
      case _:
        return null;
    }
  }
}
