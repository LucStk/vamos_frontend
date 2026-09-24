// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_bounds_trigger.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripBoundsTrigger)
final tripBoundsTriggerProvider = TripBoundsTriggerProvider._();

final class TripBoundsTriggerProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  TripBoundsTriggerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripBoundsTriggerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripBoundsTriggerHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return tripBoundsTrigger(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$tripBoundsTriggerHash() => r'f16ee21d47132e950e50700934e34654a2e7a9f5';
