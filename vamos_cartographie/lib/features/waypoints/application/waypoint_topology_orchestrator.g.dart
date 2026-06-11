// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_topology_orchestrator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WaypointTopologyOrchestrator)
final waypointTopologyOrchestratorProvider =
    WaypointTopologyOrchestratorFamily._();

final class WaypointTopologyOrchestratorProvider
    extends $NotifierProvider<WaypointTopologyOrchestrator, void> {
  WaypointTopologyOrchestratorProvider._({
    required WaypointTopologyOrchestratorFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waypointTopologyOrchestratorProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointTopologyOrchestratorHash();

  @override
  String toString() {
    return r'waypointTopologyOrchestratorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WaypointTopologyOrchestrator create() => WaypointTopologyOrchestrator();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointTopologyOrchestratorProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointTopologyOrchestratorHash() =>
    r'f1b99b746a4ed11e7e73a364d45fccca0d4544f8';

final class WaypointTopologyOrchestratorFamily extends $Family
    with
        $ClassFamilyOverride<
          WaypointTopologyOrchestrator,
          void,
          void,
          void,
          int
        > {
  WaypointTopologyOrchestratorFamily._()
    : super(
        retry: null,
        name: r'waypointTopologyOrchestratorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointTopologyOrchestratorProvider call(int tripId) =>
      WaypointTopologyOrchestratorProvider._(argument: tripId, from: this);

  @override
  String toString() => r'waypointTopologyOrchestratorProvider';
}

abstract class _$WaypointTopologyOrchestrator extends $Notifier<void> {
  late final _$args = ref.$arg as int;
  int get tripId => _$args;

  void build(int tripId);
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
    element.handleCreate(ref, () => build(_$args));
  }
}
