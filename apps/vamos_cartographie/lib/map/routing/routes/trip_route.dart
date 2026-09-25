import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_application/trip/domain/trip.dart';
import 'package:vamos_cartographie/map/features/trip_map/application/application.dart';

part 'trip_route.g.dart';

@TypedGoRoute<TripRoute>(path: '/trip/:tripId')
class TripRoute extends GoRouteData with $TripRoute {
  const TripRoute({required this.tripId});

  final String tripId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TripMapScreen(tripId: TripId(tripId));
  }
}
