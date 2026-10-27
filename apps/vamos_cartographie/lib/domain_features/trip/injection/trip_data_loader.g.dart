// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_data_loader.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loadTrips)
final loadTripsProvider = LoadTripsProvider._();

final class LoadTripsProvider
    extends
        $FunctionalProvider<AsyncValue<Failure?>, Failure?, FutureOr<Failure?>>
    with $FutureModifier<Failure?>, $FutureProvider<Failure?> {
  LoadTripsProvider._()
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
  String debugGetCreateSourceHash() => _$loadTripsHash();

  @$internal
  @override
  $FutureProviderElement<Failure?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Failure?> create(Ref ref) {
    return loadTrips(ref);
  }
}

String _$loadTripsHash() => r'38be15531047071f2964d6e534c42ad0c301650b';

@ProviderFor(ensureTripLoaded)
final ensureTripLoadedProvider = EnsureTripLoadedFamily._();

final class EnsureTripLoadedProvider
    extends
        $FunctionalProvider<AsyncValue<Failure?>, Failure?, FutureOr<Failure?>>
    with $FutureModifier<Failure?>, $FutureProvider<Failure?> {
  EnsureTripLoadedProvider._({
    required EnsureTripLoadedFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'ensureTripLoadedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ensureTripLoadedHash();

  @override
  String toString() {
    return r'ensureTripLoadedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Failure?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Failure?> create(Ref ref) {
    final argument = this.argument as TripId;
    return ensureTripLoaded(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is EnsureTripLoadedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ensureTripLoadedHash() => r'e10a2ec9878057790e263679d59d56e8a428453a';

final class EnsureTripLoadedFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Failure?>, TripId> {
  EnsureTripLoadedFamily._()
    : super(
        retry: null,
        name: r'ensureTripLoadedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EnsureTripLoadedProvider call(TripId tripId) =>
      EnsureTripLoadedProvider._(argument: tripId, from: this);

  @override
  String toString() => r'ensureTripLoadedProvider';
}
