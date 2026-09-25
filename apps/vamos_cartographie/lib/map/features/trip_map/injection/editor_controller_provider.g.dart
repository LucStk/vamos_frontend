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
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = mapCameraHolderProvider;
  static final $allTransitiveDependencies1 =
      MapCameraHolderProvider.$allTransitiveDependencies0;

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
    r'7467c704ef632a76490d2027fb9404fe7764be64';

final class MapEditorControllerFamily extends $Family
    with $FunctionalFamilyOverride<MapEditorController, TripId> {
  MapEditorControllerFamily._()
    : super(
        retry: null,
        name: r'mapEditorControllerProvider',
        dependencies: <ProviderOrFamily>[mapCameraHolderProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapEditorControllerProvider.$allTransitiveDependencies0,
          MapEditorControllerProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: false,
      );

  MapEditorControllerProvider call(TripId tripId) =>
      MapEditorControllerProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapEditorControllerProvider';
}

@ProviderFor(EditorModeNotifier)
final editorModeProvider = EditorModeNotifierFamily._();

final class EditorModeNotifierProvider
    extends $NotifierProvider<EditorModeNotifier, MapEditorMode> {
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
  Override overrideWithValue(MapEditorMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapEditorMode>(value),
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
    r'56767efb26f9fe940bf794d62ea84e20def9569e';

final class EditorModeNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EditorModeNotifier,
          MapEditorMode,
          MapEditorMode,
          MapEditorMode,
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

abstract class _$EditorModeNotifier extends $Notifier<MapEditorMode> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  MapEditorMode build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapEditorMode, MapEditorMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapEditorMode, MapEditorMode>,
              MapEditorMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
