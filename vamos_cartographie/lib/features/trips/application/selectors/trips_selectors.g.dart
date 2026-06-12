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
          ValueListenable<int>?,
          ValueListenable<int>?,
          ValueListenable<int>?
        >
    with $Provider<ValueListenable<int>?> {
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
  $ProviderElement<ValueListenable<int>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ValueListenable<int>? create(Ref ref) {
    final argument = this.argument as int;
    return tripListenable(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValueListenable<int>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ValueListenable<int>?>(value),
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

String _$tripListenableHash() => r'd3e2763c9b43cb6d129987090f994649dc4edcc7';

final class TripListenableFamily extends $Family
    with $FunctionalFamilyOverride<ValueListenable<int>?, int> {
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

String _$tripHash() => r'8c0c050903e53d25022c0673c6498c9fc543e8e9';

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

  TripProvider call(int id) => TripProvider._(argument: id, from: this);

  @override
  String toString() => r'tripProvider';
}
