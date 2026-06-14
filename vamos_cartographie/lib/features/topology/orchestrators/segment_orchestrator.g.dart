// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_orchestrator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SegmentOrchestrator)
final segmentOrchestratorProvider = SegmentOrchestratorFamily._();

final class SegmentOrchestratorProvider
    extends $NotifierProvider<SegmentOrchestrator, void> {
  SegmentOrchestratorProvider._({
    required SegmentOrchestratorFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'segmentOrchestratorProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentOrchestratorHash();

  @override
  String toString() {
    return r'segmentOrchestratorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SegmentOrchestrator create() => SegmentOrchestrator();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentOrchestratorProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentOrchestratorHash() =>
    r'c145c7d468e985b62552f52658f9166a090d169a';

final class SegmentOrchestratorFamily extends $Family
    with $ClassFamilyOverride<SegmentOrchestrator, void, void, void, Id<Trip>> {
  SegmentOrchestratorFamily._()
    : super(
        retry: null,
        name: r'segmentOrchestratorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentOrchestratorProvider call(Id<Trip> tripId) =>
      SegmentOrchestratorProvider._(argument: tripId, from: this);

  @override
  String toString() => r'segmentOrchestratorProvider';
}

abstract class _$SegmentOrchestrator extends $Notifier<void> {
  late final _$args = ref.$arg as Id<Trip>;
  Id<Trip> get tripId => _$args;

  void build(Id<Trip> tripId);
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
