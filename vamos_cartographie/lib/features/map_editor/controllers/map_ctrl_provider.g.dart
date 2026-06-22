// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_ctrl_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapCtrl)
final mapCtrlProvider = MapCtrlFamily._();

final class MapCtrlProvider extends $NotifierProvider<MapCtrl, MapState> {
  MapCtrlProvider._({
    required MapCtrlFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'mapCtrlProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapCtrlHash();

  @override
  String toString() {
    return r'mapCtrlProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapCtrl create() => MapCtrl();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapCtrlProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapCtrlHash() => r'4c47374f6f537641d58cb6a4974848826c7d49c3';

final class MapCtrlFamily extends $Family
    with $ClassFamilyOverride<MapCtrl, MapState, MapState, MapState, Id<Trip>> {
  MapCtrlFamily._()
    : super(
        retry: null,
        name: r'mapCtrlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MapCtrlProvider call(Id<Trip> tripId) =>
      MapCtrlProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapCtrlProvider';
}

abstract class _$MapCtrl extends $Notifier<MapState> {
  late final _$args = ref.$arg as Id<Trip>;
  Id<Trip> get tripId => _$args;

  MapState build(Id<Trip> tripId);
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
