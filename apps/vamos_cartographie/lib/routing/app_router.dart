import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

import '/domain_features/auth/providers/auth_providers.dart';

import 'routes/routes.dart';
import 'routes/auth_routes.dart' as auth;

import '/map/camera/domain/camera_vision.dart';
import '/map/features/explore_map/explore_map_screen.dart';
import "/map/injection/map_gesture_handler.dart";

// import '/map/camera/injection/user_location_trigger.dart';
// import '/map/features/explore_map/injection/trip_bounds_trigger.dart';
part 'app_router.g.dart';

@Dependencies([MapGestureHandlerNotifier])
@TypedGoRoute<ExploreRoute>(
  path: '/',
  routes: [TypedGoRoute<TripRoute>(path: 'trip/:tripId')],
)
class ExploreRoute extends GoRouteData with $ExploreRoute {
  const ExploreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExploreMapScreen();
  }
}

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final refresh = ValueNotifier<int>(0);
  ref.listen(currentUserIdProvider, (_, __) => refresh.value++);
  ref.onDispose(refresh.dispose);

  final router = GoRouter(
    initialLocation: '/',
    refreshListenable: refresh,
    redirect: (context, state) {
      final loggedIn = ref.read(authRepositoryProvider).currentUser != null;
      final needsAuth = state.matchedLocation.startsWith('/profile');
      if (!loggedIn && needsAuth) return '/login';
      return null;
    },
    routes: [...$appRoutes, ...auth.$appRoutes],
  );
  ref.onDispose(router.dispose);
  return router;
}
