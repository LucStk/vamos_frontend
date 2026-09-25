// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapEditor)
final mapEditorProvider = MapEditorFamily._();

final class MapEditorProvider
    extends $NotifierProvider<MapEditor, MapEditorMode> {
  MapEditorProvider._({
    required MapEditorFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapEditorProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = mapCameraProvider;

  @override
  String debugGetCreateSourceHash() => _$mapEditorHash();

  @override
  String toString() {
    return r'mapEditorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapEditor create() => MapEditor();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapEditorMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapEditorMode>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapEditorProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapEditorHash() => r'd49d1f8b4ec25023dc21a181cce977e6e3ea9fd9';

final class MapEditorFamily extends $Family
    with
        $ClassFamilyOverride<
          MapEditor,
          MapEditorMode,
          MapEditorMode,
          MapEditorMode,
          TripId
        > {
  MapEditorFamily._()
    : super(
        retry: null,
        name: r'mapEditorProvider',
        dependencies: <ProviderOrFamily>[mapCameraProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapEditorProvider.$allTransitiveDependencies0,
        ],
        isAutoDispose: false,
      );

  MapEditorProvider call(TripId tripId) =>
      MapEditorProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapEditorProvider';
}

abstract class _$MapEditor extends $Notifier<MapEditorMode> {
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
