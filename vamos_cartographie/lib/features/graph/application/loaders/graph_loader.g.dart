// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_loader.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GraphLoader)
final graphLoaderProvider = GraphLoaderFamily._();

final class GraphLoaderProvider
    extends $AsyncNotifierProvider<GraphLoader, void> {
  GraphLoaderProvider._({
    required GraphLoaderFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'graphLoaderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$graphLoaderHash();

  @override
  String toString() {
    return r'graphLoaderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GraphLoader create() => GraphLoader();

  @override
  bool operator ==(Object other) {
    return other is GraphLoaderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$graphLoaderHash() => r'7d75d2fd909e078e978c80796ae9f0cede35c456';

final class GraphLoaderFamily extends $Family
    with
        $ClassFamilyOverride<
          GraphLoader,
          AsyncValue<void>,
          void,
          FutureOr<void>,
          int
        > {
  GraphLoaderFamily._()
    : super(
        retry: null,
        name: r'graphLoaderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GraphLoaderProvider call(int tripId) =>
      GraphLoaderProvider._(argument: tripId, from: this);

  @override
  String toString() => r'graphLoaderProvider';
}

abstract class _$GraphLoader extends $AsyncNotifier<void> {
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
