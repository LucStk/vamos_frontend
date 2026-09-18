// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapEditorController)
final mapEditorControllerProvider = MapEditorControllerFamily._();

final class MapEditorControllerProvider
    extends
        $FunctionalProvider<
          MapEditorController,
          MapEditorController,
          MapEditorController
        >
    with $Provider<MapEditorController> {
  MapEditorControllerProvider._({
    required MapEditorControllerFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapEditorControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapEditorControllerHash();

  @override
  String toString() {
    return r'mapEditorControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<MapEditorController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MapEditorController create(Ref ref) {
    final argument = this.argument as TripId;
    return mapEditorController(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapEditorController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapEditorController>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapEditorControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapEditorControllerHash() =>
    r'88a015b2387cfc4b90d4914b378fab7bbec2d670';

final class MapEditorControllerFamily extends $Family
    with $FunctionalFamilyOverride<MapEditorController, TripId> {
  MapEditorControllerFamily._()
    : super(
        retry: null,
        name: r'mapEditorControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MapEditorControllerProvider call(TripId tripId) =>
      MapEditorControllerProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapEditorControllerProvider';
}

@ProviderFor(EditorModeNotifier)
final editorModeProvider = EditorModeNotifierProvider._();

final class EditorModeNotifierProvider
    extends $NotifierProvider<EditorModeNotifier, MapViewerMode> {
  EditorModeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editorModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editorModeNotifierHash();

  @$internal
  @override
  EditorModeNotifier create() => EditorModeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapViewerMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapViewerMode>(value),
    );
  }
}

String _$editorModeNotifierHash() =>
    r'b092d7ae0545115c1a12049d100c3dcf4e915d9e';

abstract class _$EditorModeNotifier extends $Notifier<MapViewerMode> {
  MapViewerMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapViewerMode, MapViewerMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapViewerMode, MapViewerMode>,
              MapViewerMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
