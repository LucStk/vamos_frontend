// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_editor_scene.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vertexItems)
final vertexItemsProvider = VertexItemsFamily._();

final class VertexItemsProvider
    extends
        $FunctionalProvider<List<PointItem>, List<PointItem>, List<PointItem>>
    with $Provider<List<PointItem>> {
  VertexItemsProvider._({
    required VertexItemsFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'vertexItemsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = vertexItemProvider;
  static final $allTransitiveDependencies1 =
      VertexItemProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$vertexItemsHash();

  @override
  String toString() {
    return r'vertexItemsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<PointItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<PointItem> create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return vertexItems(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PointItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PointItem>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexItemsHash() => r'df082fcfbddbcf74ad35730cd3818daeec28ef98';

final class VertexItemsFamily extends $Family
    with $FunctionalFamilyOverride<List<PointItem>, (TripId, MapCameraReader)> {
  VertexItemsFamily._()
    : super(
        retry: null,
        name: r'vertexItemsProvider',
        dependencies: <ProviderOrFamily>[vertexItemProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          VertexItemsProvider.$allTransitiveDependencies0,
          VertexItemsProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: true,
      );

  VertexItemsProvider call(TripId tripId, MapCameraReader camera) =>
      VertexItemsProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'vertexItemsProvider';
}

@ProviderFor(segmentItems)
final segmentItemsProvider = SegmentItemsFamily._();

final class SegmentItemsProvider
    extends $FunctionalProvider<List<LineItem>, List<LineItem>, List<LineItem>>
    with $Provider<List<LineItem>> {
  SegmentItemsProvider._({
    required SegmentItemsFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'segmentItemsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = segmentItemProvider;

  @override
  String debugGetCreateSourceHash() => _$segmentItemsHash();

  @override
  String toString() {
    return r'segmentItemsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<LineItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<LineItem> create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return segmentItems(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LineItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LineItem>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentItemsHash() => r'f2e5b23da5a4611eef69c4cffbd5f63cda2c4eac';

final class SegmentItemsFamily extends $Family
    with $FunctionalFamilyOverride<List<LineItem>, (TripId, MapCameraReader)> {
  SegmentItemsFamily._()
    : super(
        retry: null,
        name: r'segmentItemsProvider',
        dependencies: <ProviderOrFamily>[segmentItemProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          SegmentItemsProvider.$allTransitiveDependencies0,
        ],
        isAutoDispose: true,
      );

  SegmentItemsProvider call(TripId tripId, MapCameraReader camera) =>
      SegmentItemsProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'segmentItemsProvider';
}

@ProviderFor(tripEditorSceneItems)
final tripEditorSceneItemsProvider = TripEditorSceneItemsFamily._();

final class TripEditorSceneItemsProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  TripEditorSceneItemsProvider._({
    required TripEditorSceneItemsFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'tripEditorSceneItemsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = sketchItemProvider;
  static final $allTransitiveDependencies1 =
      SketchItemProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      SketchItemProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 = vertexItemsProvider;
  static final $allTransitiveDependencies4 =
      VertexItemsProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies5 =
      VertexItemsProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies6 = segmentItemsProvider;
  static final $allTransitiveDependencies7 =
      SegmentItemsProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies8 = cameraOrNullProvider;
  static final $allTransitiveDependencies9 = localizationItemProvider;

  @override
  String debugGetCreateSourceHash() => _$tripEditorSceneItemsHash();

  @override
  String toString() {
    return r'tripEditorSceneItemsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<SceneItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SceneItem> create(Ref ref) {
    final argument = this.argument as TripId;
    return tripEditorSceneItems(ref, argument);
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
    return other is TripEditorSceneItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripEditorSceneItemsHash() =>
    r'69286299c1f415d17619ab405ab1551aa1cda7a2';

final class TripEditorSceneItemsFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, TripId> {
  TripEditorSceneItemsFamily._()
    : super(
        retry: null,
        name: r'tripEditorSceneItemsProvider',
        dependencies: <ProviderOrFamily>[
          sketchItemProvider,
          vertexItemsProvider,
          segmentItemsProvider,
          cameraOrNullProvider,
          localizationItemProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          TripEditorSceneItemsProvider.$allTransitiveDependencies0,
          TripEditorSceneItemsProvider.$allTransitiveDependencies1,
          TripEditorSceneItemsProvider.$allTransitiveDependencies2,
          TripEditorSceneItemsProvider.$allTransitiveDependencies3,
          TripEditorSceneItemsProvider.$allTransitiveDependencies4,
          TripEditorSceneItemsProvider.$allTransitiveDependencies5,
          TripEditorSceneItemsProvider.$allTransitiveDependencies6,
          TripEditorSceneItemsProvider.$allTransitiveDependencies7,
          TripEditorSceneItemsProvider.$allTransitiveDependencies8,
          TripEditorSceneItemsProvider.$allTransitiveDependencies9,
        },
        isAutoDispose: true,
      );

  TripEditorSceneItemsProvider call(TripId tripId) =>
      TripEditorSceneItemsProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripEditorSceneItemsProvider';
}

@ProviderFor(tripEditorScene)
final tripEditorSceneProvider = TripEditorSceneFamily._();

final class TripEditorSceneProvider
    extends $FunctionalProvider<MapScene, MapScene, MapScene>
    with $Provider<MapScene> {
  TripEditorSceneProvider._({
    required TripEditorSceneFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'tripEditorSceneProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = tripEditorSceneItemsProvider;
  static final $allTransitiveDependencies1 =
      TripEditorSceneItemsProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      TripEditorSceneItemsProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      TripEditorSceneItemsProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies4 =
      TripEditorSceneItemsProvider.$allTransitiveDependencies3;
  static final $allTransitiveDependencies5 =
      TripEditorSceneItemsProvider.$allTransitiveDependencies4;
  static final $allTransitiveDependencies6 =
      TripEditorSceneItemsProvider.$allTransitiveDependencies5;
  static final $allTransitiveDependencies7 =
      TripEditorSceneItemsProvider.$allTransitiveDependencies6;
  static final $allTransitiveDependencies8 =
      TripEditorSceneItemsProvider.$allTransitiveDependencies7;
  static final $allTransitiveDependencies9 =
      TripEditorSceneItemsProvider.$allTransitiveDependencies8;
  static final $allTransitiveDependencies10 =
      TripEditorSceneItemsProvider.$allTransitiveDependencies9;

  @override
  String debugGetCreateSourceHash() => _$tripEditorSceneHash();

  @override
  String toString() {
    return r'tripEditorSceneProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<MapScene> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapScene create(Ref ref) {
    final argument = this.argument as TripId;
    return tripEditorScene(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapScene value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapScene>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripEditorSceneProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripEditorSceneHash() => r'4911042a7c991bc870aac63a17ebdce57f57ff86';

final class TripEditorSceneFamily extends $Family
    with $FunctionalFamilyOverride<MapScene, TripId> {
  TripEditorSceneFamily._()
    : super(
        retry: null,
        name: r'tripEditorSceneProvider',
        dependencies: <ProviderOrFamily>[tripEditorSceneItemsProvider],
        $allTransitiveDependencies: <ProviderOrFamily>{
          TripEditorSceneProvider.$allTransitiveDependencies0,
          TripEditorSceneProvider.$allTransitiveDependencies1,
          TripEditorSceneProvider.$allTransitiveDependencies2,
          TripEditorSceneProvider.$allTransitiveDependencies3,
          TripEditorSceneProvider.$allTransitiveDependencies4,
          TripEditorSceneProvider.$allTransitiveDependencies5,
          TripEditorSceneProvider.$allTransitiveDependencies6,
          TripEditorSceneProvider.$allTransitiveDependencies7,
          TripEditorSceneProvider.$allTransitiveDependencies8,
          TripEditorSceneProvider.$allTransitiveDependencies9,
          TripEditorSceneProvider.$allTransitiveDependencies10,
        },
        isAutoDispose: true,
      );

  TripEditorSceneProvider call(TripId tripId) =>
      TripEditorSceneProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripEditorSceneProvider';
}
