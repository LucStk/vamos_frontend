// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GestureStateNotifier)
final gestureStateProvider = GestureStateNotifierFamily._();

final class GestureStateNotifierProvider
    extends $NotifierProvider<GestureStateNotifier, GestureState> {
  GestureStateNotifierProvider._({
    required GestureStateNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'gestureStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gestureStateNotifierHash();

  @override
  String toString() {
    return r'gestureStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GestureStateNotifier create() => GestureStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GestureState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GestureState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GestureStateNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gestureStateNotifierHash() =>
    r'1722751d172ef738cfad208da6e814e065fa3e0e';

final class GestureStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          GestureStateNotifier,
          GestureState,
          GestureState,
          GestureState,
          TripId
        > {
  GestureStateNotifierFamily._()
    : super(
        retry: null,
        name: r'gestureStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GestureStateNotifierProvider call(TripId tripId) =>
      GestureStateNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'gestureStateProvider';
}

abstract class _$GestureStateNotifier extends $Notifier<GestureState> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  GestureState build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<GestureState, GestureState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GestureState, GestureState>,
              GestureState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(MapStateNotifier)
final mapStateProvider = MapStateNotifierFamily._();

final class MapStateNotifierProvider
    extends $NotifierProvider<MapStateNotifier, MapEditorState> {
  MapStateNotifierProvider._({
    required MapStateNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapStateProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapStateNotifierHash();

  @override
  String toString() {
    return r'mapStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapStateNotifier create() => MapStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapEditorState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapEditorState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapStateNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapStateNotifierHash() => r'70d0671a8fb242f549bd9d016d34e7c77704348b';

final class MapStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MapStateNotifier,
          MapEditorState,
          MapEditorState,
          MapEditorState,
          TripId
        > {
  MapStateNotifierFamily._()
    : super(
        retry: null,
        name: r'mapStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MapStateNotifierProvider call(TripId tripId) =>
      MapStateNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapStateProvider';
}

abstract class _$MapStateNotifier extends $Notifier<MapEditorState> {
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
