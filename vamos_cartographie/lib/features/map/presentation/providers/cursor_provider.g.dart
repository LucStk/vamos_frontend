// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapCursorNotifier)
final mapCursorProvider = MapCursorNotifierFamily._();

final class MapCursorNotifierProvider
    extends $NotifierProvider<MapCursorNotifier, MapCursorState> {
  MapCursorNotifierProvider._({
    required MapCursorNotifierFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'mapCursorProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapCursorNotifierHash();

  @override
  String toString() {
    return r'mapCursorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapCursorNotifier create() => MapCursorNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapCursorState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapCursorState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapCursorNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapCursorNotifierHash() => r'573da57d3e68bd373bf52fde1f2e4b72aded0fc7';

final class MapCursorNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MapCursorNotifier,
          MapCursorState,
          MapCursorState,
          MapCursorState,
          Id<Trip>
        > {
  MapCursorNotifierFamily._()
    : super(
        retry: null,
        name: r'mapCursorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MapCursorNotifierProvider call(Id<Trip> tripId) =>
      MapCursorNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapCursorProvider';
}

abstract class _$MapCursorNotifier extends $Notifier<MapCursorState> {
  late final _$args = ref.$arg as Id<Trip>;
  Id<Trip> get tripId => _$args;

  MapCursorState build(Id<Trip> tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapCursorState, MapCursorState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapCursorState, MapCursorState>,
              MapCursorState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
