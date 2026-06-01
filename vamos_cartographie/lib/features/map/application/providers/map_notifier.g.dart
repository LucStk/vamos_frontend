// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapStateNotifier)
final mapStateProvider = MapStateNotifierFamily._();

final class MapStateNotifierProvider
    extends $NotifierProvider<MapStateNotifier, MapState> {
  MapStateNotifierProvider._({
    required MapStateNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'mapStateProvider',
         isAutoDispose: true,
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
  Override overrideWithValue(MapState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapState>(value),
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

String _$mapStateNotifierHash() => r'db480b39a348ce5f2726c58c973e172d853f2fed';

final class MapStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MapStateNotifier,
          MapState,
          MapState,
          MapState,
          int
        > {
  MapStateNotifierFamily._()
    : super(
        retry: null,
        name: r'mapStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MapStateNotifierProvider call(int tripId) =>
      MapStateNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapStateProvider';
}

abstract class _$MapStateNotifier extends $Notifier<MapState> {
  late final _$args = ref.$arg as int;
  int get tripId => _$args;

  MapState build(int tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapState, MapState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapState, MapState>,
              MapState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
