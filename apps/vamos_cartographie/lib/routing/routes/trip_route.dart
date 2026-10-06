import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_application/trip/domain/trip.dart';
import 'package:trip_application/trip/trip.dart';
import '../../map/camera/domain/domain.dart';
import '../../map/features/trip_map/trip_map_screen.dart';
import "/routing/app_router.dart";

class TripRoute extends GoRouteData with $TripRoute {
  TripRoute({required this.tripId, this.$extra});

  final String tripId;
  CameraVision? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TripMapScreen(tripId: TripId(tripId), initialVision: $extra);
  }
}
