// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_orchestrator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WaypointOrchestrator)
final waypointOrchestratorProvider = WaypointOrchestratorProvider._();

final class WaypointOrchestratorProvider
    extends $NotifierProvider<WaypointOrchestrator, void> {
  WaypointOrchestratorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waypointOrchestratorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waypointOrchestratorHash();

  @$internal
  @override
  WaypointOrchestrator create() => WaypointOrchestrator();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$waypointOrchestratorHash() =>
    r'948fabdac0b3f5a53b5c76d98e74e6069e8ec67d';

abstract class _$WaypointOrchestrator extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
