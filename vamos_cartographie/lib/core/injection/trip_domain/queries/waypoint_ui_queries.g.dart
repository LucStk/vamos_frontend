// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_ui_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(waypointUi)
final waypointUiProvider = WaypointUiFamily._();

final class WaypointUiProvider
    extends $FunctionalProvider<Waypoint?, Waypoint?, Waypoint?>
    with $Provider<Waypoint?> {
  WaypointUiProvider._({
    required WaypointUiFamily super.from,
    required WaypointId super.argument,
  }) : super(
         retry: null,
         name: r'waypointUiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointUiHash();

  @override
  String toString() {
    return r'waypointUiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Waypoint?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Waypoint? create(Ref ref) {
    final argument = this.argument as WaypointId;
    return waypointUi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Waypoint? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Waypoint?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointUiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointUiHash() => r'f8d0b7d2d72495904764ce0104d1ad3344644e70';

final class WaypointUiFamily extends $Family
    with $FunctionalFamilyOverride<Waypoint?, WaypointId> {
  WaypointUiFamily._()
    : super(
        retry: null,
        name: r'waypointUiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointUiProvider call(WaypointId id) =>
      WaypointUiProvider._(argument: id, from: this);

  @override
  String toString() => r'waypointUiProvider';
}
