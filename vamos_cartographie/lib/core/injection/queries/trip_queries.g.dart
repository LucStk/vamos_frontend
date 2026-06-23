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

String _$tripHash() => r'e1edf312624ae84d647ed07cc7df6ba63287f9b3';

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
