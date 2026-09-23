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
    r'3ca9d1002088230351aabb654f3beed4e9c5760a';

final class ProjectedTripEditorSceneFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedObject>, TripId> {
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

String _$tripEditorSceneHash() => r'6068c07828e9096f1866d8780730fd894eb95e10';

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
