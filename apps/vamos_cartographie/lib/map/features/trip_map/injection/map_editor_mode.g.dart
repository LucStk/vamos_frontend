// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_editor_mode.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapEditor)
final mapEditorProvider = MapEditorFamily._();

final class MapEditorProvider
    extends $NotifierProvider<MapEditor, ModeState<TripEditMode>> {
  MapEditorProvider._({
    required MapEditorFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapEditorProvider',
         isAutoDispose: true,
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
  Override overrideWithValue(ModeState<TripEditMode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModeState<TripEditMode>>(value),
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

String _$mapEditorHash() => r'1b0a34665838be17650c5ad3f91205e69245172e';

final class MapEditorFamily extends $Family
    with
        $ClassFamilyOverride<
          MapEditor,
          ModeState<TripEditMode>,
          ModeState<TripEditMode>,
          ModeState<TripEditMode>,
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
        isAutoDispose: true,
      );

  MapEditorProvider call(TripId tripId) =>
      MapEditorProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapEditorProvider';
}

abstract class _$MapEditor extends $Notifier<ModeState<TripEditMode>> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  ModeState<TripEditMode> build(TripId tripId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<ModeState<TripEditMode>, ModeState<TripEditMode>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ModeState<TripEditMode>, ModeState<TripEditMode>>,
              ModeState<TripEditMode>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
