// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_segment_orchestrator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DisplaySegmentOrchestrator)
final displaySegmentOrchestratorProvider = DisplaySegmentOrchestratorFamily._();

final class DisplaySegmentOrchestratorProvider
    extends $NotifierProvider<DisplaySegmentOrchestrator, Id<Vertex>?> {
  DisplaySegmentOrchestratorProvider._({
    required DisplaySegmentOrchestratorFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'displaySegmentOrchestratorProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$displaySegmentOrchestratorHash();

  @override
  String toString() {
    return r'displaySegmentOrchestratorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DisplaySegmentOrchestrator create() => DisplaySegmentOrchestrator();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Id<Vertex>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Id<Vertex>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DisplaySegmentOrchestratorProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$displaySegmentOrchestratorHash() =>
    r'c19dfab319956957c4e515ed7e5b1456b85dea32';

final class DisplaySegmentOrchestratorFamily extends $Family
    with
        $ClassFamilyOverride<
          DisplaySegmentOrchestrator,
          Id<Vertex>?,
          Id<Vertex>?,
          Id<Vertex>?,
          Id<Trip>
        > {
  DisplaySegmentOrchestratorFamily._()
    : super(
        retry: null,
        name: r'displaySegmentOrchestratorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  DisplaySegmentOrchestratorProvider call(Id<Trip> tripId) =>
      DisplaySegmentOrchestratorProvider._(argument: tripId, from: this);

  @override
  String toString() => r'displaySegmentOrchestratorProvider';
}

abstract class _$DisplaySegmentOrchestrator extends $Notifier<Id<Vertex>?> {
  late final _$args = ref.$arg as Id<Trip>;
  Id<Trip> get tripId => _$args;

  Id<Vertex>? build(Id<Trip> tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Id<Vertex>?, Id<Vertex>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Id<Vertex>?, Id<Vertex>?>,
              Id<Vertex>?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
