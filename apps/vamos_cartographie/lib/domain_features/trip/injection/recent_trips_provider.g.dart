// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_trips_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Les derniers voyages ouverts, du plus récent au plus ancien, sans doublon.

@ProviderFor(RecentTrips)
final recentTripsProvider = RecentTripsProvider._();

/// Les derniers voyages ouverts, du plus récent au plus ancien, sans doublon.
final class RecentTripsProvider
    extends $NotifierProvider<RecentTrips, List<RecentTrip>> {
  /// Les derniers voyages ouverts, du plus récent au plus ancien, sans doublon.
  RecentTripsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentTripsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentTripsHash();

  @$internal
  @override
  RecentTrips create() => RecentTrips();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RecentTrip> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RecentTrip>>(value),
    );
  }
}

String _$recentTripsHash() => r'0000000000000000000000000000000000000000';

/// Les derniers voyages ouverts, du plus récent au plus ancien, sans doublon.

abstract class _$RecentTrips extends $Notifier<List<RecentTrip>> {
  List<RecentTrip> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<RecentTrip>, List<RecentTrip>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<RecentTrip>, List<RecentTrip>>,
              List<RecentTrip>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
