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
         isAutoDispose: true,
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

String _$tripDetailsLoaderHash() => r'06f8c469ef942289b8bc72bcb8909c4946b05351';

final class TripDetailsLoaderFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, TripId> {
  TripDetailsLoaderFamily._()
    : super(
        retry: null,
        name: r'tripDetailsLoaderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
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

String _$loadTripsNotifierHash() => r'66782028c33f49475d676741cb4b17413cb60424';
