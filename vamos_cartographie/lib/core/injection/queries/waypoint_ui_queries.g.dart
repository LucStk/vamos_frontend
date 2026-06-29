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
    extends $FunctionalProvider<WaypointUi?, WaypointUi?, WaypointUi?>
    with $Provider<WaypointUi?> {
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
  $ProviderElement<WaypointUi?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WaypointUi? create(Ref ref) {
    final argument = this.argument as WaypointId;
    return waypointUi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaypointUi? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaypointUi?>(value),
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

String _$waypointUiHash() => r'6696cf18ed77326e4ef29c805df20409184b3be6';

final class WaypointUiFamily extends $Family
    with $FunctionalFamilyOverride<WaypointUi?, WaypointId> {
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
