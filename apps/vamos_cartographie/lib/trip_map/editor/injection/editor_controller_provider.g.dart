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
    r'a3e0dfc0515e66a7312c1d7a6bd6354ef7893920';

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
final editorModeProvider = EditorModeNotifierFamily._();

final class EditorModeNotifierProvider
    extends $NotifierProvider<EditorModeNotifier, MapViewerMode> {
  EditorModeNotifierProvider._({
    required EditorModeNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'editorModeProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$editorModeNotifierHash();

  @override
  String toString() {
    return r'editorModeProvider'
        ''
        '($argument)';
  }

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

  @override
  bool operator ==(Object other) {
    return other is EditorModeNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$editorModeNotifierHash() =>
    r'bb7f3f8ad55e5396dec4c80578b15ef3c9de3fac';

final class EditorModeNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EditorModeNotifier,
          MapViewerMode,
          MapViewerMode,
          MapViewerMode,
          TripId
        > {
  EditorModeNotifierFamily._()
    : super(
        retry: null,
        name: r'editorModeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  EditorModeNotifierProvider call(TripId tripId) =>
      EditorModeNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'editorModeProvider';
}

abstract class _$EditorModeNotifier extends $Notifier<MapViewerMode> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  MapViewerMode build(TripId tripId);
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
    element.handleCreate(ref, () => build(_$args));
  }
}
