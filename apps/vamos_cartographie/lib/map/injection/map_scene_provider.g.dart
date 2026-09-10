// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_scene_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projectVertex)
final projectVertexProvider = ProjectVertexFamily._();

final class ProjectVertexProvider
    extends
        $FunctionalProvider<
          List<ProjectedPoint>,
          List<ProjectedPoint>,
          List<ProjectedPoint>
        >
    with $Provider<List<ProjectedPoint>> {
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
  $ProviderElement<List<ProjectedPoint>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProjectedPoint> create(Ref ref) {
    final argument = this.argument as TripId;
    return projectVertex(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProjectedPoint> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProjectedPoint>>(value),
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

String _$projectVertexHash() => r'6b2e8f89b79b5a35dfad7df9ca39a3a0f0da8403';

final class ProjectVertexFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedPoint>, TripId> {
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
          List<ProjectedLine>,
          List<ProjectedLine>,
          List<ProjectedLine>
        >
    with $Provider<List<ProjectedLine>> {
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
  $ProviderElement<List<ProjectedLine>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProjectedLine> create(Ref ref) {
    final argument = this.argument as TripId;
    return projectSegment(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProjectedLine> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProjectedLine>>(value),
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

String _$projectSegmentHash() => r'8f3ed45711ba9caf02ace3a7e13e3355c2759d36';

final class ProjectSegmentFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedLine>, TripId> {
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
    extends $FunctionalProvider<ProjectedLine?, ProjectedLine?, ProjectedLine?>
    with $Provider<ProjectedLine?> {
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
  $ProviderElement<ProjectedLine?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectedLine? create(Ref ref) {
    final argument = this.argument as TripId;
    return projectSketchSegment(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectedLine? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectedLine?>(value),
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
    r'fc4ddadb5cbd8e88ed0194b8cd7a1846a44efec8';

final class ProjectSketchSegmentFamily extends $Family
    with $FunctionalFamilyOverride<ProjectedLine?, TripId> {
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
        $FunctionalProvider<ProjectedPoint?, ProjectedPoint?, ProjectedPoint?>
    with $Provider<ProjectedPoint?> {
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
  $ProviderElement<ProjectedPoint?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectedPoint? create(Ref ref) {
    final argument = this.argument as TripId;
    return projectSketchPencil(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectedPoint? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectedPoint?>(value),
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
    r'432c77cb4911ca8a11f864948ac5283fdf4e2523';

final class ProjectSketchPencilFamily extends $Family
    with $FunctionalFamilyOverride<ProjectedPoint?, TripId> {
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
        $FunctionalProvider<ProjectedPoint?, ProjectedPoint?, ProjectedPoint?>
    with $Provider<ProjectedPoint?> {
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
  $ProviderElement<ProjectedPoint?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectedPoint? create(Ref ref) {
    return projectUserLocation(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectedPoint? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectedPoint?>(value),
    );
  }
}

String _$projectUserLocationHash() =>
    r'83034157181ee8686acab4656711fb4897483cce';

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
         isAutoDispose: true,
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

String _$projectedSceneHash() => r'3324b451c98bf57f47334eddeeb770b918630b46';

final class ProjectedSceneFamily extends $Family
    with $FunctionalFamilyOverride<ProjectedScene, TripId> {
  ProjectedSceneFamily._()
    : super(
        retry: null,
        name: r'projectedSceneProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectedSceneProvider call(TripId tripId) =>
      ProjectedSceneProvider._(argument: tripId, from: this);

  @override
  String toString() => r'projectedSceneProvider';
}
