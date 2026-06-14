// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_selectors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripById)
final tripByIdProvider = TripByIdFamily._();

final class TripByIdProvider extends $FunctionalProvider<Trip?, Trip?, Trip?>
    with $Provider<Trip?> {
  TripByIdProvider._({
    required TripByIdFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'tripByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripByIdHash();

  @override
  String toString() {
    return r'tripByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Trip?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Trip? create(Ref ref) {
    final argument = this.argument as Id<Trip>;
    return tripById(ref, argument);
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
    return other is TripByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripByIdHash() => r'07a6c012e6cb07b7e06b9a39d987e850f7ddf16e';

final class TripByIdFamily extends $Family
    with $FunctionalFamilyOverride<Trip?, Id<Trip>> {
  TripByIdFamily._()
    : super(
        retry: null,
        name: r'tripByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripByIdProvider call(Id<Trip> id) =>
      TripByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'tripByIdProvider';
}
