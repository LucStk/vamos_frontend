// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_editor_scene.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projectedTripEditorScene)
final projectedTripEditorSceneProvider = ProjectedTripEditorSceneFamily._();

final class ProjectedTripEditorSceneProvider
    extends
        $FunctionalProvider<
          List<ProjectedObject>,
          List<ProjectedObject>,
          List<ProjectedObject>
        >
    with $Provider<List<ProjectedObject>> {
  ProjectedTripEditorSceneProvider._({
    required ProjectedTripEditorSceneFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'projectedTripEditorSceneProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = sketchElementProjectionProvider;
  static final $allTransitiveDependencies1 =
      SketchElementProjectionProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      SketchElementProjectionProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      SketchElementProjectionProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies4 = userLocationProjectionProvider;
  static final $allTransitiveDependencies5 = allVertexProjectionProvider;
  static final $allTransitiveDependencies6 =
      AllVertexProjectionProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies7 = allSegmentProjectionProvider;

  @override
  String debugGetCreateSourceHash() => _$projectedTripEditorSceneHash();

  @override
  String toString() {
    return r'projectedTripEditorSceneProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<ProjectedObject>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProjectedObject> create(Ref ref) {
    final argument = this.argument as TripId;
    return projectedTripEditorScene(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProjectedObject> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProjectedObject>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectedTripEditorSceneProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectedTripEditorSceneHash() =>
    r'c0bb7891786a2b61b74d5c5cc14d666f4fc27f2f';

final class ProjectedTripEditorSceneFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedObject>, TripId> {
  ProjectedTripEditorSceneFamily._()
    : super(
        retry: null,
        name: r'projectedTripEditorSceneProvider',
        dependencies: <ProviderOrFamily>[
          sketchElementProjectionProvider,
          userLocationProjectionProvider,
          allVertexProjectionProvider,
          allSegmentProjectionProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          ProjectedTripEditorSceneProvider.$allTransitiveDependencies0,
          ProjectedTripEditorSceneProvider.$allTransitiveDependencies1,
          ProjectedTripEditorSceneProvider.$allTransitiveDependencies2,
          ProjectedTripEditorSceneProvider.$allTransitiveDependencies3,
          ProjectedTripEditorSceneProvider.$allTransitiveDependencies4,
          ProjectedTripEditorSceneProvider.$allTransitiveDependencies5,
          ProjectedTripEditorSceneProvider.$allTransitiveDependencies6,
          ProjectedTripEditorSceneProvider.$allTransitiveDependencies7,
        },
        isAutoDispose: true,
      );

  ProjectedTripEditorSceneProvider call(TripId tripId) =>
      ProjectedTripEditorSceneProvider._(argument: tripId, from: this);

  @override
  String toString() => r'projectedTripEditorSceneProvider';
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

  static final $allTransitiveDependencies0 = projectedTripEditorSceneProvider;
  static final $allTransitiveDependencies1 =
      ProjectedTripEditorSceneProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      ProjectedTripEditorSceneProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      ProjectedTripEditorSceneProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies4 =
      ProjectedTripEditorSceneProvider.$allTransitiveDependencies3;
  static final $allTransitiveDependencies5 =
      ProjectedTripEditorSceneProvider.$allTransitiveDependencies4;
  static final $allTransitiveDependencies6 =
      ProjectedTripEditorSceneProvider.$allTransitiveDependencies5;
  static final $allTransitiveDependencies7 =
      ProjectedTripEditorSceneProvider.$allTransitiveDependencies6;
  static final $allTransitiveDependencies8 =
      ProjectedTripEditorSceneProvider.$allTransitiveDependencies7;
  static final $allTransitiveDependencies9 = modeContextProvider;

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

String _$tripEditorSceneHash() => r'd85509ba3a6de3466a75553506f86d2e071701a9';

final class TripEditorSceneFamily extends $Family
    with $FunctionalFamilyOverride<MapScene, TripId> {
  TripEditorSceneFamily._()
    : super(
        retry: null,
        name: r'tripEditorSceneProvider',
        dependencies: <ProviderOrFamily>[
          projectedTripEditorSceneProvider,
          modeContextProvider,
        ],
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
        },
        isAutoDispose: true,
      );

  TripEditorSceneProvider call(TripId tripId) =>
      TripEditorSceneProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripEditorSceneProvider';
}
