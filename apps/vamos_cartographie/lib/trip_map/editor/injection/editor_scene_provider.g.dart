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
    extends
        $FunctionalProvider<
          List<ProjectedObject>,
          List<ProjectedObject>,
          List<ProjectedObject>
        >
    with $Provider<List<ProjectedObject>> {
  EditorProjectedSceneProvider._({
    required EditorProjectedSceneFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'editorProjectedSceneProvider',
         isAutoDispose: true,
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
  $ProviderElement<List<ProjectedObject>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProjectedObject> create(Ref ref) {
    final argument = this.argument as TripId;
    return editorProjectedScene(ref, argument);
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
    return other is EditorProjectedSceneProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$editorProjectedSceneHash() =>
    r'd6f5e1a3cc92bf63547c188690f6dda9c7ae6abf';

final class EditorProjectedSceneFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedObject>, TripId> {
  EditorProjectedSceneFamily._()
    : super(
        retry: null,
        name: r'editorProjectedSceneProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EditorProjectedSceneProvider call(TripId tripId) =>
      EditorProjectedSceneProvider._(argument: tripId, from: this);

  @override
  String toString() => r'editorProjectedSceneProvider';
}
