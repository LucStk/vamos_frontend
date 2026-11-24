// routing/routes/auth_routes.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:map_engine/map_engine.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import 'package:vamos_cartographie/domain_features/auth/presentation/login_page.dart';
import 'package:vamos_cartographie/domain_features/auth/presentation/register_page.dart';
import 'package:vamos_cartographie/domain_features/auth/presentation/register_success_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/edit_profile_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/editor_profile_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/viewer_profile_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/search/user_search_page.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/routing/trip_navigation.dart';

part 'auth_routes.g.dart';

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

/// Création de compte. Comme la connexion, c'est une route : une page posée
/// par `Navigator.push` par-dessus serait invisible du routeur, et le shell
/// de la carte la rendrait inerte dès que l'adresse revient à « / ».
@TypedGoRoute<RegisterRoute>(path: '/register')
class RegisterRoute extends GoRouteData with $RegisterRoute {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RegisterPage();
  }
}

/// Compte créé : l'adresse à confirmer est dans le chemin, pour que la page
/// se reconstruise seule au besoin.
@TypedGoRoute<RegisterSuccessRoute>(path: '/register/success/:email')
class RegisterSuccessRoute extends GoRouteData with $RegisterSuccessRoute {
  const RegisterSuccessRoute(this.email);

  final String email;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RegisterSuccessPage(email: email);
  }
}

@TypedGoRoute<UserProfileRoute>(path: '/user/:userId')
class UserProfileRoute extends GoRouteData with $UserProfileRoute {
  const UserProfileRoute(this.userId);

  final String userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(
      builder: (context, ref, _) => ViewerProfilePage(
        userId: UserId(userId),
        onOpenTrip: (id) => openTripOnMap(context, ref, id),
        onOpenUser: (UserId userId) =>
            UserProfileRoute(userId.value).push(context),
      ),
    );
  }
}

@TypedGoRoute<ProfileRoute>(path: '/profile')
class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(
      builder: (context, ref, _) => EditorProfilePage(
        onCreateTrip: () {
          ref.applyTransition(Transition.to(PlaceNewTripOrigin()));
          backToMap(context);
        },
        onOpenTrip: (id) => openTripOnMap(context, ref, id),
        onOpenUser: (UserId userId) =>
            UserProfileRoute(userId.value).push(context),
      ),
    );
  }
}

/// Modifier son profil : sous `/profile`, donc protégée comme elle.
@TypedGoRoute<EditProfileRoute>(path: '/profile/edit')
class EditProfileRoute extends GoRouteData with $EditProfileRoute {
  const EditProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EditProfilePage();
  }
}

/// Recherche d'un autre utilisateur par début de nom.
@TypedGoRoute<UserSearchRoute>(path: '/users')
class UserSearchRoute extends GoRouteData with $UserSearchRoute {
  const UserSearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserSearchPage(
      onOpenUser: (UserId userId) =>
          UserProfileRoute(userId.value).push(context),
    );
  }
}
