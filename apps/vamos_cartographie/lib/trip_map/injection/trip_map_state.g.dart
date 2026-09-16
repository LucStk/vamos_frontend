// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_map_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TripMapStateNotifier)
final mapEditorStateProvider = TripMapStateNotifierFamily._();

final class TripMapStateNotifierProvider
    extends $NotifierProvider<TripMapStateNotifier, TripMapState> {
  TripMapStateNotifierProvider._({
    required TripMapStateNotifierFamily super.from,
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
  TripMapStateNotifier create() => TripMapStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripMapState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripMapState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripMapStateNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapEditorStateNotifierHash() =>
    r'109ec436d7ee12770b22af84a7a87b8371ac15e7';

final class TripMapStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TripMapStateNotifier,
          TripMapState,
          TripMapState,
          TripMapState,
          TripId
        > {
  TripMapStateNotifierFamily._()
    : super(
        retry: null,
        name: r'mapEditorStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TripMapStateNotifierProvider call(TripId tripId) =>
      TripMapStateNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapEditorStateProvider';
}

abstract class _$TripMapStateNotifier extends $Notifier<TripMapState> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  TripMapState build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TripMapState, TripMapState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TripMapState, TripMapState>,
              TripMapState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
