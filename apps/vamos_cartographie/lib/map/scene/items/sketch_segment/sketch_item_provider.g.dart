// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sketchItem)
final sketchItemProvider = SketchItemFamily._();

final class SketchItemProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  SketchItemProvider._({
    required SketchItemFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'sketchItemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sketchItemHash();

  @override
  String toString() {
    return r'sketchItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<SceneItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SceneItem> create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return sketchItem(ref, argument.$1, argument.$2);
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
    return other is SketchItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sketchItemHash() => r'543386f6d463e95e9de95dc8a801ba15608d09a3';

final class SketchItemFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, (TripId, MapCameraReader)> {
  SketchItemFamily._()
    : super(
        retry: null,
        name: r'sketchItemProvider',
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
        isAutoDispose: true,
      );

  SketchItemProvider call(TripId tripId, MapCameraReader cameraReader) =>
      SketchItemProvider._(argument: (tripId, cameraReader), from: this);

  @override
  String toString() => r'sketchItemProvider';
}
