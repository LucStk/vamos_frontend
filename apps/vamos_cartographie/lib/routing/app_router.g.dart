// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

@Dependencies([mapScene, MapEditor, MapExplore])
List<RouteBase> get $appRoutes => [$exploreRoute];

@Dependencies([mapScene, MapEditor, MapExplore])
RouteBase get $exploreRoute => GoRouteData.$route(
  path: '/explore',
  hasOverriddenOnExit: false,
  factory: $ExploreRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'trip/:tripId',
      hasOverriddenOnExit: false,
      factory: $TripRoute._fromState,
    ),
  ],
);

@Dependencies([mapScene, MapEditor, MapExplore])
mixin $ExploreRoute on GoRouteData {
  static ExploreRoute _fromState(GoRouterState state) => const ExploreRoute();

  @override
  String get location => GoRouteData.$location('/explore');

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

@Dependencies([mapScene, MapEditor])
mixin $TripRoute on GoRouteData {
  static TripRoute _fromState(GoRouterState state) =>
      TripRoute(tripId: state.pathParameters['tripId']!);

  TripRoute get _self => this as TripRoute;

  @override
  String get location => GoRouteData.$location(
    '/explore/trip/${Uri.encodeComponent(_self.tripId)}',
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
