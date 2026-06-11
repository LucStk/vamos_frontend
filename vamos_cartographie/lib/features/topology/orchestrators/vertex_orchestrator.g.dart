// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_orchestrator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VertexOrchestrator)
final vertexOrchestratorProvider = VertexOrchestratorFamily._();

final class VertexOrchestratorProvider
    extends $NotifierProvider<VertexOrchestrator, void> {
  VertexOrchestratorProvider._({
    required VertexOrchestratorFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'vertexOrchestratorProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexOrchestratorHash();

  @override
  String toString() {
    return r'vertexOrchestratorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  VertexOrchestrator create() => VertexOrchestrator();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexOrchestratorProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexOrchestratorHash() =>
    r'7e963c691310be8c8f8f6e39740d7f338839b050';

final class VertexOrchestratorFamily extends $Family
    with $ClassFamilyOverride<VertexOrchestrator, void, void, void, int> {
  VertexOrchestratorFamily._()
    : super(
        retry: null,
        name: r'vertexOrchestratorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexOrchestratorProvider call(int tripId) =>
      VertexOrchestratorProvider._(argument: tripId, from: this);

  @override
  String toString() => r'vertexOrchestratorProvider';
}

abstract class _$VertexOrchestrator extends $Notifier<void> {
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
