// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_selectors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripListenable)
final tripListenableProvider = TripListenableFamily._();

final class TripListenableProvider
    extends
        $FunctionalProvider<
          ValueListenable<Trip>?,
          ValueListenable<Trip>?,
          ValueListenable<Trip>?
        >
    with $Provider<ValueListenable<Trip>?> {
  TripListenableProvider._({
    required TripListenableFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'tripListenableProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripListenableHash();

  @override
  String toString() {
    return r'tripListenableProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ValueListenable<Trip>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ValueListenable<Trip>? create(Ref ref) {
    final argument = this.argument as int;
    return tripListenable(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValueListenable<Trip>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ValueListenable<Trip>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripListenableProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripListenableHash() => r'7acde94f304f7f734d9c220f30fff981bd1fee86';

final class TripListenableFamily extends $Family
    with $FunctionalFamilyOverride<ValueListenable<Trip>?, int> {
  TripListenableFamily._()
    : super(
        retry: null,
        name: r'tripListenableProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripListenableProvider call(int id) =>
      TripListenableProvider._(argument: id, from: this);

  @override
  String toString() => r'tripListenableProvider';
}

@ProviderFor(trip)
final tripProvider = TripFamily._();

final class TripProvider extends $FunctionalProvider<Trip, Trip, Trip>
    with $Provider<Trip> {
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
  $ProviderElement<Trip> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Trip create(Ref ref) {
    final argument = this.argument as int;
    return trip(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Trip value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Trip>(value),
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

String _$tripHash() => r'cf8784d41603922ba55f3b8ca45907e6c620c320';

final class TripFamily extends $Family
    with $FunctionalFamilyOverride<Trip, int> {
  TripFamily._()
    : super(
        retry: null,
        name: r'tripProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripProvider call(int id) => TripProvider._(argument: id, from: this);

  @override
  String toString() => r'tripProvider';
}
