// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_editor_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapEditorStateNotifier)
final mapEditorStateProvider = MapEditorStateNotifierFamily._();

final class MapEditorStateNotifierProvider
    extends $NotifierProvider<MapEditorStateNotifier, MapEditorState> {
  MapEditorStateNotifierProvider._({
    required MapEditorStateNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapEditorStateProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapEditorStateNotifierHash();

  @override
  String toString() {
    return r'mapEditorStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapEditorStateNotifier create() => MapEditorStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapEditorState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapEditorState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapEditorStateNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapEditorStateNotifierHash() =>
    r'109ec436d7ee12770b22af84a7a87b8371ac15e7';

final class MapEditorStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MapEditorStateNotifier,
          MapEditorState,
          MapEditorState,
          MapEditorState,
          TripId
        > {
  MapEditorStateNotifierFamily._()
    : super(
        retry: null,
        name: r'mapEditorStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MapEditorStateNotifierProvider call(TripId tripId) =>
      MapEditorStateNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapEditorStateProvider';
}

abstract class _$MapEditorStateNotifier extends $Notifier<MapEditorState> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  MapEditorState build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapEditorState, MapEditorState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapEditorState, MapEditorState>,
              MapEditorState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
