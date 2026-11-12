// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geosearch_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(geosearchRepository)
final geosearchRepositoryProvider = GeosearchRepositoryProvider._();

final class GeosearchRepositoryProvider
    extends
        $FunctionalProvider<
          GeosearchRepository,
          GeosearchRepository,
          GeosearchRepository
        >
    with $Provider<GeosearchRepository> {
  GeosearchRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'geosearchRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$geosearchRepositoryHash();

  @$internal
  @override
  $ProviderElement<GeosearchRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GeosearchRepository create(Ref ref) {
    return geosearchRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GeosearchRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GeosearchRepository>(value),
    );
  }
}

String _$geosearchRepositoryHash() =>
    r'0bdd9b3bf58b97ff2366056b5fa65b03260a1c4f';
