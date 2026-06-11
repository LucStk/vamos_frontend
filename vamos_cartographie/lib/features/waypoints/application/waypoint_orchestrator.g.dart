// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_orchestrator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WaypointOrchestrator)
final waypointOrchestratorProvider = WaypointOrchestratorFamily._();

final class WaypointOrchestratorProvider
    extends $NotifierProvider<WaypointOrchestrator, void> {
  WaypointOrchestratorProvider._({
    required WaypointOrchestratorFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waypointOrchestratorProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointOrchestratorHash();

  @override
  String toString() {
    return r'waypointOrchestratorProvider'
        ''
        '($argument)';
  }

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

  @override
  bool operator ==(Object other) {
    return other is WaypointOrchestratorProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointOrchestratorHash() =>
    r'0fcea477e9a0d2f72200a87dfd17b01bb82597e1';

final class WaypointOrchestratorFamily extends $Family
    with $ClassFamilyOverride<WaypointOrchestrator, void, void, void, int> {
  WaypointOrchestratorFamily._()
    : super(
        retry: null,
        name: r'waypointOrchestratorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointOrchestratorProvider call(int tripId) =>
      WaypointOrchestratorProvider._(argument: tripId, from: this);

  @override
  String toString() => r'waypointOrchestratorProvider';
}

abstract class _$WaypointOrchestrator extends $Notifier<void> {
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
