// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segmentService)
final segmentServiceProvider = SegmentServiceProvider._();

final class SegmentServiceProvider
    extends $FunctionalProvider<SegmentService, SegmentService, SegmentService>
    with $Provider<SegmentService> {
  SegmentServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentServiceHash();

  @$internal
  @override
  $ProviderElement<SegmentService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SegmentService create(Ref ref) {
    return segmentService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SegmentService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SegmentService>(value),
    );
  }
}

String _$segmentServiceHash() => r'eb3141226afa0b12fa862e682935d7dbc18a5541';
