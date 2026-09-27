import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_application/trip/domain/trip.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip/trip.dart';
import "/map/map.dart";
import "/routing/app_router.dart";

@Dependencies([mapScene, MapEditor])
class TripRoute extends GoRouteData with $TripRoute {
  TripRoute({required this.tripId, this.$extra});

  final String tripId;
  CameraVision? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TripMapScreen(tripId: TripId(tripId), initialVision: $extra);
  }
}
