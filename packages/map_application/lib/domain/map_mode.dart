import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/domain/domain.dart';

part 'map_mode.freezed.dart';

@freezed
sealed class MapMode with _$MapMode {
  const factory MapMode.idle() = Idle;
  const factory MapMode.sketchMode({
    required VertexId vertexStart,
    required List<LatLng> itineraire,
    required MobilityType mobilityType,
    VertexId? touchedVertex,
  }) = Sketch;
}
