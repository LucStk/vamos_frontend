// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$exploreRoute];

RouteBase get $exploreRoute => GoRouteData.$route(
  path: '/',
  hasOverriddenOnExit: false,
  factory: $ExploreRoute._fromState,
);

mixin $ExploreRoute on GoRouteData {
  static ExploreRoute _fromState(GoRouterState state) => const ExploreRoute();

  @override
  String get location => GoRouteData.$location('/');

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

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(router)
final routerProvider = RouterProvider._();

final class RouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  RouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[
          mapGestureHandlerProvider,
          mapSceneProvider,
          visualTargetsProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          RouterProvider.$allTransitiveDependencies0,
          RouterProvider.$allTransitiveDependencies1,
          RouterProvider.$allTransitiveDependencies2,
          RouterProvider.$allTransitiveDependencies3,
          RouterProvider.$allTransitiveDependencies4,
          RouterProvider.$allTransitiveDependencies5,
          RouterProvider.$allTransitiveDependencies6,
          RouterProvider.$allTransitiveDependencies7,
          RouterProvider.$allTransitiveDependencies8,
          RouterProvider.$allTransitiveDependencies9,
          RouterProvider.$allTransitiveDependencies10,
          RouterProvider.$allTransitiveDependencies11,
          RouterProvider.$allTransitiveDependencies12,
          RouterProvider.$allTransitiveDependencies13,
          RouterProvider.$allTransitiveDependencies14,
          RouterProvider.$allTransitiveDependencies15,
        },
      );

  static final $allTransitiveDependencies0 = mapGestureHandlerProvider;
  static final $allTransitiveDependencies1 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies4 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies3;
  static final $allTransitiveDependencies5 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies4;
  static final $allTransitiveDependencies6 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies5;
  static final $allTransitiveDependencies7 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies6;
  static final $allTransitiveDependencies8 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies7;
  static final $allTransitiveDependencies9 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies8;
  static final $allTransitiveDependencies10 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies9;
  static final $allTransitiveDependencies11 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies10;
  static final $allTransitiveDependencies12 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies11;
  static final $allTransitiveDependencies13 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies12;
  static final $allTransitiveDependencies14 =
      MapGestureHandlerNotifierProvider.$allTransitiveDependencies13;
  static final $allTransitiveDependencies15 = visualTargetsProvider;

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return router(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$routerHash() => r'117b8b428444260dc4f6554f20162d75aff850eb';
