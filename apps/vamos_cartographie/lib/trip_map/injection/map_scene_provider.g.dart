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

String _$mapSceneHash() => r'cda2c6991a6d996c561aa2d52ac1675a3f1e2484';

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

String _$projectVertexHash() => r'8b953d40a383cb99555f2d72104e5e2030116a43';

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

String _$projectSegmentHash() => r'646a9f094afaad588fe141865003f1805984c3e1';

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
    r'3dd839c0d75999c58fe0a85f5472a52d799e7a76';

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
    r'f3abd5194c4589543dfc8fa96485c42a00dc9fa9';

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

@ProviderFor(projectUserLocation)
final projectUserLocationProvider = ProjectUserLocationProvider._();

final class ProjectUserLocationProvider
    extends
        $FunctionalProvider<
          ProjectedPoint<MapPoint>?,
          ProjectedPoint<MapPoint>?,
          ProjectedPoint<MapPoint>?
        >
    with $Provider<ProjectedPoint<MapPoint>?> {
  ProjectUserLocationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectUserLocationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectUserLocationHash();

  @$internal
  @override
  $ProviderElement<ProjectedPoint<MapPoint>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProjectedPoint<MapPoint>? create(Ref ref) {
    return projectUserLocation(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectedPoint<MapPoint>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectedPoint<MapPoint>?>(value),
    );
  }
}

String _$projectUserLocationHash() =>
    r'd40407a65bc545d3e5b3b3328ddcbb1918449050';
