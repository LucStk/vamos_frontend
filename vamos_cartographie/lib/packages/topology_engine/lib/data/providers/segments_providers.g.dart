// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segments_providers.dart';

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

String _$segmentRepositoryHash() => r'2d4fada1c12bf9494745c9ebfa4c72d2b0e848c4';
