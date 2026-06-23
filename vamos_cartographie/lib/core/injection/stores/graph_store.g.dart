// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rawGraphStore)
final rawGraphStoreProvider = RawGraphStoreProvider._();

final class RawGraphStoreProvider
    extends $FunctionalProvider<GraphStore, GraphStore, GraphStore>
    with $Provider<GraphStore> {
  RawGraphStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawGraphStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawGraphStoreHash();

  @$internal
  @override
  $ProviderElement<GraphStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GraphStore create(Ref ref) {
    return rawGraphStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphStore>(value),
    );
  }
}

String _$rawGraphStoreHash() => r'1f381479849b7aa0f0856b211cb6a9c7b8e39b32';
