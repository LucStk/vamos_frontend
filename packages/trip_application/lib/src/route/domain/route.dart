import 'package:domain_core/geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/route/domain/mobility_types.dart';
import 'package:trip_application/src/trip/domain/domain.dart';

part 'route.freezed.dart';

sealed class RouteFields implements HasId {
  Geometry get geometry;
  MapLatLngBounds? get bounds;
  LatLng get startPoint;
  @override
  TripId get id;
}

@freezed
abstract class RouteRemoteModel with _$RouteRemoteModel implements RouteFields {
  const factory RouteRemoteModel({
    required TripId id,
    required Geometry geometry,
    required LatLng startPoint,
    MapLatLngBounds? bounds,
  }) = _RouteRemoteModel;

  const RouteRemoteModel._();

  factory RouteRemoteModel.fromFields(RouteFields fields) {
    return RouteRemoteModel(
      id: fields.id,
      startPoint: fields.startPoint,
      bounds: fields.bounds,
      geometry: fields.geometry,
    );
  }
}

@freezed
abstract class RoutePatchModel
    with _$RoutePatchModel
    implements Patch<RouteRemoteModel>, RouteFields {
  @Implements<Patch<RouteRemoteModel>>()
  const factory RoutePatchModel.internal({
    required Geometry geometry,
    required TripId id,
    required LatLng startPoint,
    MapLatLngBounds? bounds,
    @Default(false) bool recomputing,
    Object? error,
  }) = _RoutePatchModel;

  const RoutePatchModel._();

  factory RoutePatchModel.fromFields(
    RouteFields fields, {
    bool recomputing = false,
    Object? error,
  }) {
    return RoutePatchModel.internal(
      id: fields.id,
      startPoint: fields.startPoint,
      geometry: fields.geometry,
      bounds: fields.bounds,
      recomputing: recomputing,
      error: error,
    );
  }

  factory RoutePatchModel({
    required TripId id,
    required Geometry geometry,
    required LatLng startPoint,
    bool recomputing = false,
    Object? error,
    MobilityType mobilityType = MobilityType.bike,
  }) {
    return RoutePatchModel.internal(
      id: id,
      startPoint: startPoint,
      geometry: geometry,
      recomputing: recomputing,
      error: error,
    );
  }
}
