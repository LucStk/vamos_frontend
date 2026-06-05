// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$tripsNotifierHash() => r'd6333e9068bc1c8fb317c354b11c502c45aa57b9';

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

final class TripProvider extends $FunctionalProvider<Trip?, Trip?, Trip?>
    with $Provider<Trip?> {
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
  $ProviderElement<Trip?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Trip? create(Ref ref) {
    final argument = this.argument as int;
    return trip(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Trip? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Trip?>(value),
    );
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

String _$tripHash() => r'bf52831310361217f66d58392602db70de340454';

final class TripFamily extends $Family
    with $FunctionalFamilyOverride<Trip?, int> {
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
