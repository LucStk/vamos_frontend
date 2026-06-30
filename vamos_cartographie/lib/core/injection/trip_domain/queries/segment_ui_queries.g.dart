// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_ui_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segmentRefs)
final segmentRefsProvider = SegmentRefsProvider._();

final class SegmentRefsProvider
    extends
        $FunctionalProvider<
          List<SegmentRef>,
          List<SegmentRef>,
          List<SegmentRef>
        >
    with $Provider<List<SegmentRef>> {
  SegmentRefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentRefsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentRefsHash();

  @$internal
  @override
  $ProviderElement<List<SegmentRef>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SegmentRef> create(Ref ref) {
    return segmentRefs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SegmentRef> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SegmentRef>>(value),
    );
  }
}

String _$segmentRefsHash() => r'ae09ecff86d16b2c192f24f3b6e15b67e9fbdc93';

@ProviderFor(segmentUi)
final segmentUiProvider = SegmentUiFamily._();

final class SegmentUiProvider
    extends $FunctionalProvider<SegmentUi?, SegmentUi?, SegmentUi?>
    with $Provider<SegmentUi?> {
  SegmentUiProvider._({
    required SegmentUiFamily super.from,
    required SegmentRef super.argument,
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
    final argument = this.argument as SegmentRef;
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

String _$segmentUiHash() => r'b9b33b00a3dac91fe934c54013845873f8162f57';

final class SegmentUiFamily extends $Family
    with $FunctionalFamilyOverride<SegmentUi?, SegmentRef> {
  SegmentUiFamily._()
    : super(
        retry: null,
        name: r'segmentUiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentUiProvider call(SegmentRef id) =>
      SegmentUiProvider._(argument: id, from: this);

  @override
  String toString() => r'segmentUiProvider';
}
