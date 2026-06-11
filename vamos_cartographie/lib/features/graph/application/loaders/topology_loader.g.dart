// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topology_loader.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TopologyLoader)
final topologyLoaderProvider = TopologyLoaderFamily._();

final class TopologyLoaderProvider
    extends $AsyncNotifierProvider<TopologyLoader, void> {
  TopologyLoaderProvider._({
    required TopologyLoaderFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'topologyLoaderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$topologyLoaderHash();

  @override
  String toString() {
    return r'topologyLoaderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TopologyLoader create() => TopologyLoader();

  @override
  bool operator ==(Object other) {
    return other is TopologyLoaderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$topologyLoaderHash() => r'f35a2d4c37a50488b8356d45f4ca55fbf2dfdc8c';

final class TopologyLoaderFamily extends $Family
    with
        $ClassFamilyOverride<
          TopologyLoader,
          AsyncValue<void>,
          void,
          FutureOr<void>,
          int
        > {
  TopologyLoaderFamily._()
    : super(
        retry: null,
        name: r'topologyLoaderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TopologyLoaderProvider call(int tripId) =>
      TopologyLoaderProvider._(argument: tripId, from: this);

  @override
  String toString() => r'topologyLoaderProvider';
}

abstract class _$TopologyLoader extends $AsyncNotifier<void> {
  late final _$args = ref.$arg as int;
  int get tripId => _$args;

  FutureOr<void> build(int tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
