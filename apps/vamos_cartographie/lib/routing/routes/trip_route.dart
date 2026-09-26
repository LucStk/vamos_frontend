import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_application/trip/domain/trip.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip/trip.dart';
import "/map/map.dart";
import "/routing/app_router.dart";

@Dependencies([
  mapGestureHandler,
  MapEditor,
  tripEditorScene,
  cameraDirector,
  mapCamera,
  MapCameraChanges,
  mapCameraSnapshot,
])
class TripRoute extends GoRouteData with $TripRoute {
  const TripRoute({required this.tripId});

  final String tripId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    print("go_toTripMap");
    return TripMapScreen(tripId: TripId(tripId));
  }
}
