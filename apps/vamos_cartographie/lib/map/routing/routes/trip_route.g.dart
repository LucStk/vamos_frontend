// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$tripRoute];

RouteBase get $tripRoute => GoRouteData.$route(
  path: '/trip/:tripId',
  hasOverriddenOnExit: false,
  factory: $TripRoute._fromState,
);

mixin $TripRoute on GoRouteData {
  static TripRoute _fromState(GoRouterState state) =>
      TripRoute(tripId: state.pathParameters['tripId']!);

  TripRoute get _self => this as TripRoute;

  @override
  String get location =>
      GoRouteData.$location('/trip/${Uri.encodeComponent(_self.tripId)}');

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
