// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_ui_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segmentUiIds)
final segmentUiIdsProvider = SegmentUiIdsProvider._();

final class SegmentUiIdsProvider
    extends
        $FunctionalProvider<
          List<SegmentUiId>,
          List<SegmentUiId>,
          List<SegmentUiId>
        >
    with $Provider<List<SegmentUiId>> {
  SegmentUiIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentUiIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentUiIdsHash();

  @$internal
  @override
  $ProviderElement<List<SegmentUiId>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<SegmentUiId> create(Ref ref) {
    return segmentUiIds(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SegmentUiId> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SegmentUiId>>(value),
    );
  }
}

String _$segmentUiIdsHash() => r'f9d9871438cae860f39da695a7977ab76bbdc25c';

@ProviderFor(segmentUi)
final segmentUiProvider = SegmentUiFamily._();

final class SegmentUiProvider
    extends $FunctionalProvider<SegmentUi?, SegmentUi?, SegmentUi?>
    with $Provider<SegmentUi?> {
  SegmentUiProvider._({
    required SegmentUiFamily super.from,
    required SegmentUiId super.argument,
  }) : super(
         retry: null,
         name: r'segmentUiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentUiHash();

  @override
  String toString() {
    return r'segmentUiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SegmentUi?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SegmentUi? create(Ref ref) {
    final argument = this.argument as SegmentUiId;
    return segmentUi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SegmentUi? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SegmentUi?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentUiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentUiHash() => r'125aae6577cd4a48c01edfb85e97b5241c748635';

final class SegmentUiFamily extends $Family
    with $FunctionalFamilyOverride<SegmentUi?, SegmentUiId> {
  SegmentUiFamily._()
    : super(
        retry: null,
        name: r'segmentUiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentUiProvider call(SegmentUiId id) =>
      SegmentUiProvider._(argument: id, from: this);

  @override
  String toString() => r'segmentUiProvider';
}
