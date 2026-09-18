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
    extends $FunctionalProvider<ProjectedScene, ProjectedScene, ProjectedScene>
    with $Provider<ProjectedScene> {
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
  $ProviderElement<ProjectedScene> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectedScene create(Ref ref) {
    final argument = this.argument as TripId;
    return projectedTripEditorScene(ref, argument);
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
    return other is ProjectedTripEditorSceneProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectedTripEditorSceneHash() =>
    r'acfc742c7af7aa981e0839ce4be35ab30451c0bf';

final class ProjectedTripEditorSceneFamily extends $Family
    with $FunctionalFamilyOverride<ProjectedScene, TripId> {
  ProjectedTripEditorSceneFamily._()
    : super(
        retry: null,
        name: r'projectedTripEditorSceneProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
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

String _$tripEditorSceneHash() => r'86665c47cd7d3d78cff645467877ddc19add8a26';

final class TripEditorSceneFamily extends $Family
    with $FunctionalFamilyOverride<MapScene, TripId> {
  TripEditorSceneFamily._()
    : super(
        retry: null,
        name: r'tripEditorSceneProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripEditorSceneProvider call(TripId tripId) =>
      TripEditorSceneProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripEditorSceneProvider';
}
