import 'package:go_router/go_router.dart';
import 'package:vamos_cartographie/map/map.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

import 'routes/routes.dart';
import 'routes/auth_routes.dart' as auth;

part 'app_router.g.dart';

@TypedGoRoute<ExploreRoute>(
  path: '/explore',
  routes: [TypedGoRoute<TripRoute>(path: 'trip/:tripId')],
)
@Dependencies([mapScene, MapEditor, MapExplore])
class ExploreRoute extends GoRouteData with $ExploreRoute {
  const ExploreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExploreMapScreen();
  }
}

@Dependencies([mapScene, MapEditor, MapExplore])
final appRouter = GoRouter(
  initialLocation: '/explore',
  routes: [...$appRoutes, ...auth.$appRoutes],
);
