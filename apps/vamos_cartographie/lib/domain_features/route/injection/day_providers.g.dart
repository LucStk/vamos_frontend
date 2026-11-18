// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Les journées de déplacement du trip, recalculées quand les haltes ou la
/// géométrie changent.

@ProviderFor(routeDays)
final routeDaysProvider = RouteDaysFamily._();

/// Les journées de déplacement du trip, recalculées quand les haltes ou la
/// géométrie changent.

final class RouteDaysProvider
    extends $FunctionalProvider<List<RouteDay>, List<RouteDay>, List<RouteDay>>
    with $Provider<List<RouteDay>> {
  /// Les journées de déplacement du trip, recalculées quand les haltes ou la
  /// géométrie changent.
  RouteDaysProvider._({
    required RouteDaysFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'routeDaysProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$routeDaysHash();

  @override
  String toString() {
    return r'routeDaysProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<RouteDay>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<RouteDay> create(Ref ref) {
    final argument = this.argument as TripId;
    return routeDays(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RouteDay> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RouteDay>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RouteDaysProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$routeDaysHash() => r'c7697e92969b8b9ab943f075dda842a56df7018c';

/// Les journées de déplacement du trip, recalculées quand les haltes ou la
/// géométrie changent.

final class RouteDaysFamily extends $Family
    with $FunctionalFamilyOverride<List<RouteDay>, TripId> {
  RouteDaysFamily._()
    : super(
        retry: null,
        name: r'routeDaysProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Les journées de déplacement du trip, recalculées quand les haltes ou la
  /// géométrie changent.

  RouteDaysProvider call(TripId tripId) =>
      RouteDaysProvider._(argument: tripId, from: this);

  @override
  String toString() => r'routeDaysProvider';
}

/// Un jour, retrouvé par sa halte d'arrivée. Freezed : `.select` ne reconstruit
/// que si CE jour change (borne ou numéro).

@ProviderFor(routeDay)
final routeDayProvider = RouteDayFamily._();

/// Un jour, retrouvé par sa halte d'arrivée. Freezed : `.select` ne reconstruit
/// que si CE jour change (borne ou numéro).

final class RouteDayProvider
    extends $FunctionalProvider<RouteDay?, RouteDay?, RouteDay?>
    with $Provider<RouteDay?> {
  /// Un jour, retrouvé par sa halte d'arrivée. Freezed : `.select` ne reconstruit
  /// que si CE jour change (borne ou numéro).
  RouteDayProvider._({
    required RouteDayFamily super.from,
    required (TripId, WaypointId?) super.argument,
  }) : super(
         retry: null,
         name: r'routeDayProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$routeDayHash();

  @override
  String toString() {
    return r'routeDayProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<RouteDay?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RouteDay? create(Ref ref) {
    final argument = this.argument as (TripId, WaypointId?);
    return routeDay(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouteDay? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouteDay?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RouteDayProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$routeDayHash() => r'f00b9acb86e22cbdfb3e9faa9604c92714ff1736';

/// Un jour, retrouvé par sa halte d'arrivée. Freezed : `.select` ne reconstruit
/// que si CE jour change (borne ou numéro).

final class RouteDayFamily extends $Family
    with $FunctionalFamilyOverride<RouteDay?, (TripId, WaypointId?)> {
  RouteDayFamily._()
    : super(
        retry: null,
        name: r'routeDayProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Un jour, retrouvé par sa halte d'arrivée. Freezed : `.select` ne reconstruit
  /// que si CE jour change (borne ou numéro).

  RouteDayProvider call(TripId tripId, WaypointId? endsAt) =>
      RouteDayProvider._(argument: (tripId, endsAt), from: this);

  @override
  String toString() => r'routeDayProvider';
}

/// Les tronçons de modalité d'un jour.

@ProviderFor(dayRuns)
final dayRunsProvider = DayRunsFamily._();

/// Les tronçons de modalité d'un jour.

final class DayRunsProvider
    extends $FunctionalProvider<DayRuns?, DayRuns?, DayRuns?>
    with $Provider<DayRuns?> {
  /// Les tronçons de modalité d'un jour.
  DayRunsProvider._({
    required DayRunsFamily super.from,
    required (TripId, WaypointId?) super.argument,
  }) : super(
         retry: null,
         name: r'dayRunsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dayRunsHash();

  @override
  String toString() {
    return r'dayRunsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<DayRuns?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DayRuns? create(Ref ref) {
    final argument = this.argument as (TripId, WaypointId?);
    return dayRuns(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DayRuns? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DayRuns?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DayRunsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dayRunsHash() => r'f8457d4ee88dc91c47af27da104b9c2b096f9264';

/// Les tronçons de modalité d'un jour.

final class DayRunsFamily extends $Family
    with $FunctionalFamilyOverride<DayRuns?, (TripId, WaypointId?)> {
  DayRunsFamily._()
    : super(
        retry: null,
        name: r'dayRunsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Les tronçons de modalité d'un jour.

  DayRunsProvider call(TripId tripId, WaypointId? endsAt) =>
      DayRunsProvider._(argument: (tripId, endsAt), from: this);

  @override
  String toString() => r'dayRunsProvider';
}
