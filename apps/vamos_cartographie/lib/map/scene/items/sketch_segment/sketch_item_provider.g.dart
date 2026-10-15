// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pencilItem)
final pencilItemProvider = PencilItemFamily._();

final class PencilItemProvider
    extends $FunctionalProvider<PencilItem?, PencilItem?, PencilItem?>
    with $Provider<PencilItem?> {
  PencilItemProvider._({
    required PencilItemFamily super.from,
    required MapCameraReader super.argument,
  }) : super(
         retry: null,
         name: r'pencilItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pencilItemHash();

  @override
  String toString() {
    return r'pencilItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<PencilItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PencilItem? create(Ref ref) {
    final argument = this.argument as MapCameraReader;
    return pencilItem(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PencilItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PencilItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PencilItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pencilItemHash() => r'9dbe7090d4703903185aed7e96751b7c7bd3f003';

final class PencilItemFamily extends $Family
    with $FunctionalFamilyOverride<PencilItem?, MapCameraReader> {
  PencilItemFamily._()
    : super(
        retry: null,
        name: r'pencilItemProvider',
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
        isAutoDispose: false,
      );

  PencilItemProvider call(MapCameraReader camera) =>
      PencilItemProvider._(argument: camera, from: this);

  @override
  String toString() => r'pencilItemProvider';
}

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

@ProviderFor(allSketchItem)
final allSketchItemProvider = AllSketchItemFamily._();

final class AllSketchItemProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  AllSketchItemProvider._({
    required AllSketchItemFamily super.from,
    required MapCameraReader super.argument,
  }) : super(
         retry: null,
         name: r'allSketchItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = pencilItemProvider;
  static final $allTransitiveDependencies1 = sketchTraceItemProvider;

  @override
  String debugGetCreateSourceHash() => _$allSketchItemHash();

  @override
  String toString() {
    return r'allSketchItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<SceneItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SceneItem> create(Ref ref) {
    final argument = this.argument as MapCameraReader;
    return allSketchItem(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SceneItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SceneItem>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllSketchItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allSketchItemHash() => r'f867b9a39dec28924b4d0aa228ab9fa6b911eefd';

final class AllSketchItemFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, MapCameraReader> {
  AllSketchItemFamily._()
    : super(
        retry: null,
        name: r'allSketchItemProvider',
        dependencies: <ProviderOrFamily>[
          pencilItemProvider,
          sketchTraceItemProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          AllSketchItemProvider.$allTransitiveDependencies0,
          AllSketchItemProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: false,
      );

  AllSketchItemProvider call(MapCameraReader cameraReader) =>
      AllSketchItemProvider._(argument: cameraReader, from: this);

  @override
  String toString() => r'allSketchItemProvider';
}
