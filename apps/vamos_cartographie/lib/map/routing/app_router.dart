import "package:go_router/go_router.dart";
import "package:trip_application/trip/domain/domain.dart";
import "package:vamos_cartographie/map/map.dart";

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/routing/routes/routes.dart';

part 'app_router.g.dart';

@TypedGoRoute<ExploreRoute>(
  path: '/explore',
  routes: [TypedGoRoute<TripRoute>(path: 'trip/:tripId')],
)
class ExploreRoute extends GoRouteData with $ExploreRoute {
  const ExploreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExploreMapScreen();
  }
}

final appRouter = GoRouter(routes: $appRoutes);
