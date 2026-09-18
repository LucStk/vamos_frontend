// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_scene_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projectedScene)
final projectedSceneProvider = ProjectedSceneFamily._();

final class ProjectedSceneProvider
    extends $FunctionalProvider<ProjectedScene, ProjectedScene, ProjectedScene>
    with $Provider<ProjectedScene> {
  ProjectedSceneProvider._({
    required ProjectedSceneFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'projectedSceneProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectedSceneHash();

  @override
  String toString() {
    return r'projectedSceneProvider'
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
    return projectedScene(ref, argument);
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
    return other is ProjectedSceneProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectedSceneHash() => r'550f84f4ac45f198b587b8c89f4984ada73e81e2';

final class ProjectedSceneFamily extends $Family
    with $FunctionalFamilyOverride<ProjectedScene, TripId> {
  ProjectedSceneFamily._()
    : super(
        retry: null,
        name: r'projectedSceneProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ProjectedSceneProvider call(TripId tripId) =>
      ProjectedSceneProvider._(argument: tripId, from: this);

  @override
  String toString() => r'projectedSceneProvider';
}

@ProviderFor(mapScene)
final mapSceneProvider = MapSceneFamily._();

final class MapSceneProvider
    extends $FunctionalProvider<MapScene, MapScene, MapScene>
    with $Provider<MapScene> {
  MapSceneProvider._({
    required MapSceneFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapSceneProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapSceneHash();

  @override
  String toString() {
    return r'mapSceneProvider'
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
    return mapScene(ref, argument);
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
    return other is MapSceneProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapSceneHash() => r'ef9582845dc120f84b5b66d9ba6e7c9568b08f43';

final class MapSceneFamily extends $Family
    with $FunctionalFamilyOverride<MapScene, TripId> {
  MapSceneFamily._()
    : super(
        retry: null,
        name: r'mapSceneProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MapSceneProvider call(TripId tripId) =>
      MapSceneProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapSceneProvider';
}

@ProviderFor(projectVertex)
final projectVertexProvider = ProjectVertexFamily._();

final class ProjectVertexProvider
    extends
        $FunctionalProvider<
          List<ProjectedPoint<MapPoint>>,
          List<ProjectedPoint<MapPoint>>,
          List<ProjectedPoint<MapPoint>>
        >
    with $Provider<List<ProjectedPoint<MapPoint>>> {
  ProjectVertexProvider._({
    required ProjectVertexFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'projectVertexProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectVertexHash();

  @override
  String toString() {
    return r'projectVertexProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<ProjectedPoint<MapPoint>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProjectedPoint<MapPoint>> create(Ref ref) {
    final argument = this.argument as TripId;
    return projectVertex(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProjectedPoint<MapPoint>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProjectedPoint<MapPoint>>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectVertexProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectVertexHash() => r'cd1b70f1919423843fcdbb201188710322f62148';

final class ProjectVertexFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedPoint<MapPoint>>, TripId> {
  ProjectVertexFamily._()
    : super(
        retry: null,
        name: r'projectVertexProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectVertexProvider call(TripId tripId) =>
      ProjectVertexProvider._(argument: tripId, from: this);

  @override
  String toString() => r'projectVertexProvider';
}

@ProviderFor(projectSegment)
final projectSegmentProvider = ProjectSegmentFamily._();

final class ProjectSegmentProvider
    extends
        $FunctionalProvider<
          List<ProjectedLine<MapLine>>,
          List<ProjectedLine<MapLine>>,
          List<ProjectedLine<MapLine>>
        >
    with $Provider<List<ProjectedLine<MapLine>>> {
  ProjectSegmentProvider._({
    required ProjectSegmentFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'projectSegmentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectSegmentHash();

  @override
  String toString() {
    return r'projectSegmentProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<ProjectedLine<MapLine>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProjectedLine<MapLine>> create(Ref ref) {
    final argument = this.argument as TripId;
    return projectSegment(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProjectedLine<MapLine>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProjectedLine<MapLine>>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectSegmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectSegmentHash() => r'33dcfccbb3f314fce6e08ccb3e15d1d27d73ba82';

final class ProjectSegmentFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedLine<MapLine>>, TripId> {
  ProjectSegmentFamily._()
    : super(
        retry: null,
        name: r'projectSegmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectSegmentProvider call(TripId tripId) =>
      ProjectSegmentProvider._(argument: tripId, from: this);

  @override
  String toString() => r'projectSegmentProvider';
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
