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
    required MapCameraReader super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SketchSegmentItem?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SketchSegmentItem? create(Ref ref) {
    final argument = this.argument as MapCameraReader;
    return sketchTraceItem(ref, argument);
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

String _$sketchTraceItemHash() => r'd0f13a4af47cbb8b753016d3c7f593591472c892';

final class SketchTraceItemFamily extends $Family
    with $FunctionalFamilyOverride<SketchSegmentItem?, MapCameraReader> {
  SketchTraceItemFamily._()
    : super(
        retry: null,
        name: r'sketchTraceItemProvider',
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
        isAutoDispose: false,
      );

  SketchTraceItemProvider call(MapCameraReader camera) =>
      SketchTraceItemProvider._(argument: camera, from: this);

  @override
  String toString() => r'sketchTraceItemProvider';
}
