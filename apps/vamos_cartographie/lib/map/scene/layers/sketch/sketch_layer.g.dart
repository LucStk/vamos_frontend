// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_layer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
