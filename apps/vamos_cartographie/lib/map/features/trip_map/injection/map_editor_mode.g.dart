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
    extends $NotifierProvider<MapEditor, MapEditorMode> {
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

String _$mapEditorHash() => r'5bf6ae394023bde89d9ac0c762b8823a5688a540';

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
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
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
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MapEditorMode, MapEditorMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapEditorMode, MapEditorMode>,
              MapEditorMode,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
