// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_tripRepository)
final _tripRepositoryProvider = _TripRepositoryProvider._();

final class _TripRepositoryProvider
    extends
        $FunctionalProvider<ITripRepository, ITripRepository, ITripRepository>
    with $Provider<ITripRepository> {
  _TripRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_tripRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_tripRepositoryHash();

  @$internal
  @override
  $ProviderElement<ITripRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ITripRepository create(Ref ref) {
    return _tripRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITripRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITripRepository>(value),
    );
  }
}

String _$_tripRepositoryHash() => r'0870812eebd0c290654613097007bc69d91cda75';

@ProviderFor(TripsNotifier)
final tripsProvider = TripsNotifierProvider._();

final class TripsNotifierProvider
    extends $AsyncNotifierProvider<TripsNotifier, List<Trip>> {
  TripsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripsNotifierHash();

  @$internal
  @override
  TripsNotifier create() => TripsNotifier();
}

String _$tripsNotifierHash() => r'9495f928ae19a159f140efe881a67c053d29194b';

abstract class _$TripsNotifier extends $AsyncNotifier<List<Trip>> {
  FutureOr<List<Trip>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Trip>>, List<Trip>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Trip>>, List<Trip>>,
              AsyncValue<List<Trip>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(trip)
final tripProvider = TripFamily._();

final class TripProvider
    extends $FunctionalProvider<AsyncValue<Trip>, Trip, FutureOr<Trip>>
    with $FutureModifier<Trip>, $FutureProvider<Trip> {
  TripProvider._({required TripFamily super.from, required int super.argument})
    : super(
        retry: null,
        name: r'tripProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripHash();

  @override
  String toString() {
    return r'tripProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Trip> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Trip> create(Ref ref) {
    final argument = this.argument as int;
    return trip(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TripProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripHash() => r'ffc7a7a56ea09fe338d15ec1e6472cb51467938e';

final class TripFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Trip>, int> {
  TripFamily._()
    : super(
        retry: null,
        name: r'tripProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripProvider call(int tripId) => TripProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripProvider';
}
