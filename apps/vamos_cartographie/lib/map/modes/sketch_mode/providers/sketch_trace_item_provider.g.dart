// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_trace_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sketchTraceItem)
final sketchTraceItemProvider = SketchTraceItemFamily._();

final class SketchTraceItemProvider
    extends
        $FunctionalProvider<
          SketchSegmentItem?,
          SketchSegmentItem?,
          SketchSegmentItem?
        >
    with $Provider<SketchSegmentItem?> {
  SketchTraceItemProvider._({
    required SketchTraceItemFamily super.from,
    required (bool, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'sketchTraceItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sketchTraceItemHash();

  @override
  String toString() {
    return r'sketchTraceItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<SketchSegmentItem?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SketchSegmentItem? create(Ref ref) {
    final argument = this.argument as (bool, MapCameraReader);
    return sketchTraceItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SketchSegmentItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SketchSegmentItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SketchTraceItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sketchTraceItemHash() => r'd21b7342d7f7665935159602c78920dbac593172';

final class SketchTraceItemFamily extends $Family
    with
        $FunctionalFamilyOverride<SketchSegmentItem?, (bool, MapCameraReader)> {
  SketchTraceItemFamily._()
    : super(
        retry: null,
        name: r'sketchTraceItemProvider',
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
        isAutoDispose: false,
      );

  SketchTraceItemProvider call(bool pending, MapCameraReader camera) =>
      SketchTraceItemProvider._(argument: (pending, camera), from: this);

  @override
  String toString() => r'sketchTraceItemProvider';
}
