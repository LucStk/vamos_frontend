// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_data_loader.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripDetailsLoader)
final tripDetailsLoaderProvider = TripDetailsLoaderFamily._();

final class TripDetailsLoaderProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  TripDetailsLoaderProvider._({
    required TripDetailsLoaderFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'tripDetailsLoaderProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripDetailsLoaderHash();

  @override
  String toString() {
    return r'tripDetailsLoaderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as TripId;
    return tripDetailsLoader(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TripDetailsLoaderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripDetailsLoaderHash() => r'e5d8dd6bd6eac8bb0c463f6d418fc5e6de1baaa4';

final class TripDetailsLoaderFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, TripId> {
  TripDetailsLoaderFamily._()
    : super(
        retry: null,
        name: r'tripDetailsLoaderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TripDetailsLoaderProvider call(TripId tripId) =>
      TripDetailsLoaderProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripDetailsLoaderProvider';
}

@ProviderFor(loadTripsNotifier)
final loadTripsProvider = LoadTripsNotifierProvider._();

final class LoadTripsNotifierProvider
    extends
        $FunctionalProvider<AsyncValue<Failure?>, Failure?, FutureOr<Failure?>>
    with $FutureModifier<Failure?>, $FutureProvider<Failure?> {
  LoadTripsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadTripsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadTripsNotifierHash();

  @$internal
  @override
  $FutureProviderElement<Failure?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Failure?> create(Ref ref) {
    return loadTripsNotifier(ref);
  }
}

String _$loadTripsNotifierHash() => r'd89b84ff619c2220c74d3c51e34d0cfbeca95c3e';
