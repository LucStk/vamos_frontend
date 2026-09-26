import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vamos_cartographie/domain_features/auth/presentation/login_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile_page.dart';

part 'auth_routes.g.dart';

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<ProfileRoute>(path: '/profile')
class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}
