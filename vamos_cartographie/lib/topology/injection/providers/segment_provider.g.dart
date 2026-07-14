// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segmentRemoteDatasource)
final segmentRemoteDatasourceProvider = SegmentRemoteDatasourceProvider._();

final class SegmentRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          SegmentRemoteDatasource,
          SegmentRemoteDatasource,
          SegmentRemoteDatasource
        >
    with $Provider<SegmentRemoteDatasource> {
  SegmentRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<SegmentRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SegmentRemoteDatasource create(Ref ref) {
    return segmentRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SegmentRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SegmentRemoteDatasource>(value),
    );
  }
}

String _$segmentRemoteDatasourceHash() =>
    r'c453bca3547d179470fdd6aab233c70c5dc92fa3';

@ProviderFor(segmentRepository)
final segmentRepositoryProvider = SegmentRepositoryProvider._();

final class SegmentRepositoryProvider
    extends
        $FunctionalProvider<
          SegmentRepository,
          SegmentRepository,
          SegmentRepository
        >
    with $Provider<SegmentRepository> {
  SegmentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentRepositoryHash();

  @$internal
  @override
  $ProviderElement<SegmentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SegmentRepository create(Ref ref) {
    return segmentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SegmentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SegmentRepository>(value),
    );
  }
}

String _$segmentRepositoryHash() => r'72087992023f023edd9452392f361924929c08af';

@ProviderFor(segmentStore)
final segmentStoreProvider = SegmentStoreProvider._();

final class SegmentStoreProvider
    extends
        $FunctionalProvider<
          CollectionStore<Segment>,
          CollectionStore<Segment>,
          CollectionStore<Segment>
        >
    with $Provider<CollectionStore<Segment>> {
  SegmentStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentStoreHash();

  @$internal
  @override
  $ProviderElement<CollectionStore<Segment>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CollectionStore<Segment> create(Ref ref) {
    return segmentStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CollectionStore<Segment> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CollectionStore<Segment>>(value),
    );
  }
}

String _$segmentStoreHash() => r'8bc0fc36534862c336e8ece69dfb88f5f5098014';
