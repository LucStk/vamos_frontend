import "package:go_router/go_router.dart";
import "package:vamos_cartographie/map/map.dart";

import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/routing/routes/routes.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
part 'app_router.g.dart';

@TypedGoRoute<ExploreRoute>(
  path: '/explore',
  routes: [TypedGoRoute<TripRoute>(path: 'trip/:tripId')],
)
@Dependencies([
  tripEditorScene,
  mapEditorController,
  mapExploreController,
  exploreScene,
  userLocationTrigger,
  tripBoundsTrigger,
  cameraDirector,
  mapController,
  MapCameraHolder,
  MapCameraChanges,
  mapCameraSnapshot,
])
class ExploreRoute extends GoRouteData with $ExploreRoute {
  const ExploreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExploreMapScreen();
  }
}

final appRouter = GoRouter(routes: $appRoutes);
