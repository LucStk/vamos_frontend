// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(waypointHandler)
final waypointHandlerProvider = WaypointHandlerFamily._();

final class WaypointHandlerProvider
    extends
        $FunctionalProvider<WaypointHandler, WaypointHandler, WaypointHandler>
    with $Provider<WaypointHandler> {
  WaypointHandlerProvider._({
    required WaypointHandlerFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'waypointHandlerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointHandlerHash();

  @override
  String toString() {
    return r'waypointHandlerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<WaypointHandler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WaypointHandler create(Ref ref) {
    final argument = this.argument as TripId;
    return waypointHandler(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaypointHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaypointHandler>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointHandlerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointHandlerHash() => r'cad0ef027e2817d4c68daea4e5d71d35d9e76113';

final class WaypointHandlerFamily extends $Family
    with $FunctionalFamilyOverride<WaypointHandler, TripId> {
  WaypointHandlerFamily._()
    : super(
        retry: null,
        name: r'waypointHandlerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointHandlerProvider call(TripId tripId) =>
      WaypointHandlerProvider._(argument: tripId, from: this);

  @override
  String toString() => r'waypointHandlerProvider';
}
