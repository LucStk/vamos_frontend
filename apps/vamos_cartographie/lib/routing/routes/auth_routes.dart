// routing/routes/auth_routes.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:map_engine/map_engine.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import 'package:vamos_cartographie/domain_features/auth/presentation/login_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/editor_profile_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/viewer_profile_page.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';

part 'auth_routes.g.dart';

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<UserProfileRoute>(path: '/user/:userId')
class UserProfileRoute extends GoRouteData with $UserProfileRoute {
  const UserProfileRoute(this.userId);

  final String userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(
      builder: (context, ref, _) {
        void apply(Transition t) =>
            ref.read(appModeMachineProvider.notifier).apply(t);

        return ViewerProfilePage(
          userId: UserId(userId),
          onOpenTrip: (id) {
            apply(TripMode.open(id));
            _backToMap(context);
          },
          onOpenUser: (UserId userId) => UserProfileRoute(userId.value),
        );
      },
    );
  }
}

@TypedGoRoute<ProfileRoute>(path: '/profile')
class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(
      builder: (context, ref, _) {
        void apply(Transition t) =>
            ref.read(appModeMachineProvider.notifier).apply(t);

        return EditorProfilePage(
          onCreateTrip: () {
            apply(Transition.to(PlaceNewTripOrigin()));
            _backToMap(context);
          },
          onOpenTrip: (id) {
            apply(TripMode.open(id));
            _backToMap(context);
          },
          onOpenUser: (UserId userId) => UserProfileRoute(userId.value),
        );
      },
    );
  }
}

void _backToMap(BuildContext context) =>
    context.canPop() ? context.pop() : context.go('/');
