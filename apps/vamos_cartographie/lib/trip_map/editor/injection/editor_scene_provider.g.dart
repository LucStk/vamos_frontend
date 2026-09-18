// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_scene_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(editorProjectedScene)
final editorProjectedSceneProvider = EditorProjectedSceneFamily._();

final class EditorProjectedSceneProvider
    extends $FunctionalProvider<ProjectedScene, ProjectedScene, ProjectedScene>
    with $Provider<ProjectedScene> {
  EditorProjectedSceneProvider._({
    required EditorProjectedSceneFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'editorProjectedSceneProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$editorProjectedSceneHash();

  @override
  String toString() {
    return r'editorProjectedSceneProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ProjectedScene> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectedScene create(Ref ref) {
    final argument = this.argument as TripId;
    return editorProjectedScene(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectedScene value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectedScene>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EditorProjectedSceneProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$editorProjectedSceneHash() =>
    r'11e97c4e2408671808a103710b086c021b5d1667';

final class EditorProjectedSceneFamily extends $Family
    with $FunctionalFamilyOverride<ProjectedScene, TripId> {
  EditorProjectedSceneFamily._()
    : super(
        retry: null,
        name: r'editorProjectedSceneProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  EditorProjectedSceneProvider call(TripId tripId) =>
      EditorProjectedSceneProvider._(argument: tripId, from: this);

  @override
  String toString() => r'editorProjectedSceneProvider';
}

@ProviderFor(projectSketchSegment)
final projectSketchSegmentProvider = ProjectSketchSegmentFamily._();

final class ProjectSketchSegmentProvider
    extends
        $FunctionalProvider<
          ProjectedLine<MapLine>?,
          ProjectedLine<MapLine>?,
          ProjectedLine<MapLine>?
        >
    with $Provider<ProjectedLine<MapLine>?> {
  ProjectSketchSegmentProvider._({
    required ProjectSketchSegmentFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'projectSketchSegmentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectSketchSegmentHash();

  @override
  String toString() {
    return r'projectSketchSegmentProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ProjectedLine<MapLine>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProjectedLine<MapLine>? create(Ref ref) {
    final argument = this.argument as TripId;
    return projectSketchSegment(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectedLine<MapLine>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectedLine<MapLine>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectSketchSegmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectSketchSegmentHash() =>
    r'3dcf452108e59f01fc3ec3afcdce29297d6a29e6';

final class ProjectSketchSegmentFamily extends $Family
    with $FunctionalFamilyOverride<ProjectedLine<MapLine>?, TripId> {
  ProjectSketchSegmentFamily._()
    : super(
        retry: null,
        name: r'projectSketchSegmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectSketchSegmentProvider call(TripId tripId) =>
      ProjectSketchSegmentProvider._(argument: tripId, from: this);

  @override
  String toString() => r'projectSketchSegmentProvider';
}

@ProviderFor(projectSketchPencil)
final projectSketchPencilProvider = ProjectSketchPencilFamily._();

final class ProjectSketchPencilProvider
    extends
        $FunctionalProvider<
          ProjectedPoint<MapPoint>?,
          ProjectedPoint<MapPoint>?,
          ProjectedPoint<MapPoint>?
        >
    with $Provider<ProjectedPoint<MapPoint>?> {
  ProjectSketchPencilProvider._({
    required ProjectSketchPencilFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'projectSketchPencilProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectSketchPencilHash();

  @override
  String toString() {
    return r'projectSketchPencilProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ProjectedPoint<MapPoint>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProjectedPoint<MapPoint>? create(Ref ref) {
    final argument = this.argument as TripId;
    return projectSketchPencil(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectedPoint<MapPoint>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectedPoint<MapPoint>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectSketchPencilProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectSketchPencilHash() =>
    r'342f393a410340ea0f84ce80cddffec09eb49801';

final class ProjectSketchPencilFamily extends $Family
    with $FunctionalFamilyOverride<ProjectedPoint<MapPoint>?, TripId> {
  ProjectSketchPencilFamily._()
    : super(
        retry: null,
        name: r'projectSketchPencilProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectSketchPencilProvider call(TripId tripId) =>
      ProjectSketchPencilProvider._(argument: tripId, from: this);

  @override
  String toString() => r'projectSketchPencilProvider';
}
