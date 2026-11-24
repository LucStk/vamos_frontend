// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $loginRoute,
  $registerRoute,
  $registerSuccessRoute,
  $userProfileRoute,
  $profileRoute,
  $editProfileRoute,
  $userSearchRoute,
];

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',
  hasOverriddenOnExit: false,
  factory: $LoginRoute._fromState,
);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute => GoRouteData.$route(
  path: '/register',
  hasOverriddenOnExit: false,
  factory: $RegisterRoute._fromState,
);

mixin $RegisterRoute on GoRouteData {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  @override
  String get location => GoRouteData.$location('/register');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerSuccessRoute => GoRouteData.$route(
  path: '/register/success/:email',
  hasOverriddenOnExit: false,
  factory: $RegisterSuccessRoute._fromState,
);

mixin $RegisterSuccessRoute on GoRouteData {
  static RegisterSuccessRoute _fromState(GoRouterState state) =>
      RegisterSuccessRoute(state.pathParameters['email']!);

  RegisterSuccessRoute get _self => this as RegisterSuccessRoute;

  @override
  String get location => GoRouteData.$location(
    '/register/success/${Uri.encodeComponent(_self.email)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userProfileRoute => GoRouteData.$route(
  path: '/user/:userId',
  hasOverriddenOnExit: false,
  factory: $UserProfileRoute._fromState,
);

mixin $UserProfileRoute on GoRouteData {
  static UserProfileRoute _fromState(GoRouterState state) =>
      UserProfileRoute(state.pathParameters['userId']!);

  UserProfileRoute get _self => this as UserProfileRoute;

  @override
  String get location =>
      GoRouteData.$location('/user/${Uri.encodeComponent(_self.userId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileRoute => GoRouteData.$route(
  path: '/profile',
  hasOverriddenOnExit: false,
  factory: $ProfileRoute._fromState,
);

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  @override
  String get location => GoRouteData.$location('/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editProfileRoute => GoRouteData.$route(
  path: '/profile/edit',
  hasOverriddenOnExit: false,
  factory: $EditProfileRoute._fromState,
);

mixin $EditProfileRoute on GoRouteData {
  static EditProfileRoute _fromState(GoRouterState state) =>
      const EditProfileRoute();

  @override
  String get location => GoRouteData.$location('/profile/edit');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userSearchRoute => GoRouteData.$route(
  path: '/users',
  hasOverriddenOnExit: false,
  factory: $UserSearchRoute._fromState,
);

mixin $UserSearchRoute on GoRouteData {
  static UserSearchRoute _fromState(GoRouterState state) =>
      const UserSearchRoute();

  @override
  String get location => GoRouteData.$location('/users');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
