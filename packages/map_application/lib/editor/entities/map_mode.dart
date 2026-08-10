import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/domain/domain.dart';

part 'map_mode.freezed.dart';

@freezed
abstract class RouteCorrection with _$RouteCorrection {
  const factory RouteCorrection({
    required LatLng grabPoint, // point sur le tracé où le grab a commencé
    required List<LatLng> path, // tracé en cours de la correction
    @Default(false) bool armed,
    VertexId?
    rejoinedVertex, // renseigné si la correction a rejoint l'itinéraire original
  }) = _RouteCorrection;
}

// 2. Définition de l'Union MapMode
sealed class MapMode {
  const MapMode();
}

class Idle extends MapMode {
  const Idle();
}

// 2. Union Freezed imbriquée
@freezed
sealed class SketchMode extends MapMode with _$SketchMode {
  // Constructeur privé requis par Freezed pour pouvoir hériter d'une classe parent
  const SketchMode._() : super();

  const factory SketchMode.creation({
    required VertexId vertexStart,
    required List<LatLng> itineraire,
    required MobilityType mobilityType,
    VertexId? touchedVertex,
    RouteCorrection? correction,
  }) = SketchCreation;

  const factory SketchMode.edition({
    required SegmentId segmentId,
    required List<LatLng> itineraire,
    required MobilityType mobilityType,
    VertexId? touchedVertex,
    RouteCorrection? correction,
  }) = SketchEdition;
}

extension SketchX on MapMode {
  LatLng? get pencilPositionOrNull {
    switch (this) {
      case SketchMode e:
        return e.correction?.path.last ?? e.itineraire.last;
      case _:
        return null;
    }
  }

  List<LatLng>? get sketchSegmentGeometryOrNull {
    switch (this) {
      case SketchMode e:
        return e.itineraire;
      case _:
        return null;
    }
  }
}
