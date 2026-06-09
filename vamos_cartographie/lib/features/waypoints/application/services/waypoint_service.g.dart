// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(waypointService)
final waypointServiceProvider = WaypointServiceProvider._();

final class WaypointServiceProvider
    extends
        $FunctionalProvider<WaypointService, WaypointService, WaypointService>
    with $Provider<WaypointService> {
  WaypointServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waypointServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waypointServiceHash();

  @$internal
  @override
  $ProviderElement<WaypointService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WaypointService create(Ref ref) {
    return waypointService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaypointService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaypointService>(value),
    );
  }
}

String _$waypointServiceHash() => r'2564e4277f222fed567ca0264d1659166de5e4b4';
