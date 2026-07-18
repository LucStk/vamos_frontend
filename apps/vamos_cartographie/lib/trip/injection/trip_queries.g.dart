// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(trip)
final tripProvider = TripFamily._();

final class TripProvider extends $FunctionalProvider<Trip?, Trip?, Trip?>
    with $Provider<Trip?> {
  TripProvider._({
    required TripFamily super.from,
    required TripId super.argument,
  }) : super(
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
    final argument = this.argument as TripId;
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

String _$tripHash() => r'f095ca0f0e1fa027df1faf1b0e213cd9a4906284';

final class TripFamily extends $Family
    with $FunctionalFamilyOverride<Trip?, TripId> {
  TripFamily._()
    : super(
        retry: null,
        name: r'tripProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripProvider call(TripId tripId) =>
      TripProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripProvider';
}

@ProviderFor(loadTripDetails)
final loadTripDetailsProvider = LoadTripDetailsFamily._();

final class LoadTripDetailsProvider
    extends
        $FunctionalProvider<AsyncValue<Failure?>, Failure?, FutureOr<Failure?>>
    with $FutureModifier<Failure?>, $FutureProvider<Failure?> {
  LoadTripDetailsProvider._({
    required LoadTripDetailsFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'loadTripDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadTripDetailsHash();

  @override
  String toString() {
    return r'loadTripDetailsProvider'
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
    return loadTripDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadTripDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadTripDetailsHash() => r'e34343c7d3b63717eec3dbcac245afab112db03b';

final class LoadTripDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Failure?>, TripId> {
  LoadTripDetailsFamily._()
    : super(
        retry: null,
        name: r'loadTripDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoadTripDetailsProvider call(TripId tripId) =>
      LoadTripDetailsProvider._(argument: tripId, from: this);

  @override
  String toString() => r'loadTripDetailsProvider';
}
