// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_transitions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapEditorStateTransitionsNotifier)
final mapEditorStateTransitionsProvider =
    MapEditorStateTransitionsNotifierFamily._();

final class MapEditorStateTransitionsNotifierProvider
    extends $NotifierProvider<MapEditorStateTransitionsNotifier, void> {
  MapEditorStateTransitionsNotifierProvider._({
    required MapEditorStateTransitionsNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapEditorStateTransitionsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() =>
      _$mapEditorStateTransitionsNotifierHash();

  @override
  String toString() {
    return r'mapEditorStateTransitionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapEditorStateTransitionsNotifier create() =>
      MapEditorStateTransitionsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapEditorStateTransitionsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapEditorStateTransitionsNotifierHash() =>
    r'eecadb3535c69df57ca643552c469239bd9a3834';

final class MapEditorStateTransitionsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MapEditorStateTransitionsNotifier,
          void,
          void,
          void,
          TripId
        > {
  MapEditorStateTransitionsNotifierFamily._()
    : super(
        retry: null,
        name: r'mapEditorStateTransitionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MapEditorStateTransitionsNotifierProvider call(TripId tripId) =>
      MapEditorStateTransitionsNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapEditorStateTransitionsProvider';
}

abstract class _$MapEditorStateTransitionsNotifier extends $Notifier<void> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  void build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
