import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';

import 'package:vamos_cartographie/routing/routes/auth_routes.dart' as auth;
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/auth/providers/providers.dart';
import 'package:vamos_cartographie/map/map_screen.dart';

part 'app_router.g.dart';

@Dependencies([])
@TypedGoRoute<ExploreRoute>(path: '/', routes: [])
class ExploreRoute extends GoRouteData with $ExploreRoute {
  const ExploreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MapScreen();
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
