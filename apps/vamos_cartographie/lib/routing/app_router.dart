import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/routing/map_shell.dart';

import 'package:vamos_cartographie/routing/routes/auth_routes.dart' as auth;
import 'package:vamos_cartographie/domain_features/auth/providers/providers.dart';
import 'package:vamos_cartographie/map/interaction/map_gesture_handler.dart';

import 'package:vamos_cartographie/map/scene/map_scene.dart';
import 'package:vamos_cartographie/map/interaction/visual_target.dart';
part 'app_router.g.dart';

/// La route "/" n'affiche rien elle-même : la carte vit dans [MapShell].
@TypedGoRoute<ExploreRoute>(path: '/', routes: [])
class ExploreRoute extends GoRouteData with $ExploreRoute {
  const ExploreRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(key: state.pageKey, child: const SizedBox.shrink());
}

/// Routes qui nécessitent d'être connecté.
const _protectedPrefixes = ["/profile"];

@Riverpod(
  keepAlive: true,
  dependencies: [MapGestureHandlerNotifier, mapScene, visualTargets],
)
GoRouter router(Ref ref) {
  final refresh = ValueNotifier<int>(0);
  ref.listen(currentUserIdProvider, (_, _) => refresh.value++);
  ref.onDispose(refresh.dispose);

  final router = GoRouter(
    initialLocation: '/',
    refreshListenable: refresh,
    redirect: (context, state) {
      final loggedIn = ref.read(authRepositoryProvider).currentUser != null;
      final needsAuth = _protectedPrefixes.any(
        state.matchedLocation.startsWith,
      );
      if (!loggedIn && needsAuth) return '/login';
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MapShell(onMap: state.uri.path == '/', overlay: child);
        },
        routes: [...$appRoutes, ...auth.$appRoutes],
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}
