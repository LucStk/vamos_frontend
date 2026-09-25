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

  static final $allTransitiveDependencies0 = userLocationProjectionProvider;
  static final $allTransitiveDependencies1 =
      UserLocationProjectionProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 = sketchElementProjectionProvider;
  static final $allTransitiveDependencies3 =
      SketchElementProjectionProvider.$allTransitiveDependencies1;

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
    r'0e51d668b3f9d047d8e229b5375e14123f6f9594';

final class ProjectedTripEditorSceneFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedObject>, TripId> {
  ProjectedTripEditorSceneFamily._()
    : super(
        retry: null,
        name: r'projectedTripEditorSceneProvider',
        dependencies: <ProviderOrFamily>[
          userLocationProjectionProvider,
          sketchElementProjectionProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          ProjectedTripEditorSceneProvider.$allTransitiveDependencies0,
          ProjectedTripEditorSceneProvider.$allTransitiveDependencies1,
          ProjectedTripEditorSceneProvider.$allTransitiveDependencies2,
          ProjectedTripEditorSceneProvider.$allTransitiveDependencies3,
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

String _$tripEditorSceneHash() => r'fc4109e5ee702df8f3402b947b8962108d041e81';

final class TripEditorSceneFamily extends $Family
    with $FunctionalFamilyOverride<MapScene, TripId> {
  TripEditorSceneFamily._()
    : super(
        retry: null,
        name: r'tripEditorSceneProvider',
        dependencies: <ProviderOrFamily>[
          projectedTripEditorSceneProvider,
          mapEditorProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          TripEditorSceneProvider.$allTransitiveDependencies0,
          TripEditorSceneProvider.$allTransitiveDependencies1,
          TripEditorSceneProvider.$allTransitiveDependencies2,
          TripEditorSceneProvider.$allTransitiveDependencies3,
          TripEditorSceneProvider.$allTransitiveDependencies4,
        },
        isAutoDispose: true,
      );

  TripEditorSceneProvider call(TripId tripId) =>
      TripEditorSceneProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripEditorSceneProvider';
}
