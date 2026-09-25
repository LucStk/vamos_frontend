import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_application/trip/domain/trip.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip/trip.dart';
import "/map/map.dart";
part 'trip_route.g.dart';

@TypedGoRoute<TripRoute>(path: '/trip/:tripId')
@Dependencies([
  mapController,
  mapGestureHandler,
  mapContext,
  MapEditor,
  cameraDirector,
  MapCameraChanges,
  mapCameraSnapshot,
])
class TripRoute extends GoRouteData with $TripRoute {
  const TripRoute({required this.tripId});

  final String tripId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TripMapScreen(tripId: TripId(tripId));
  }
}
