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
        dependencies: <ProviderOrFamily>[
          mapExploreProvider,
          cameraDirectorProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          TripBoundsTriggerProvider.$allTransitiveDependencies0,
          TripBoundsTriggerProvider.$allTransitiveDependencies1,
          TripBoundsTriggerProvider.$allTransitiveDependencies2,
        ],
      );

  static final $allTransitiveDependencies0 = mapExploreProvider;
  static final $allTransitiveDependencies1 =
      MapExploreProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 = cameraDirectorProvider;

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

String _$tripBoundsTriggerHash() => r'0ba2817891d9b7719b9aaf127343b4d51dfa04c6';
