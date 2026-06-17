// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pop_up_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapPopupNotifier)
final mapPopupProvider = MapPopupNotifierFamily._();

final class MapPopupNotifierProvider
    extends $NotifierProvider<MapPopupNotifier, MapPopupState?> {
  MapPopupNotifierProvider._({
    required MapPopupNotifierFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'mapPopupProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapPopupNotifierHash();

  @override
  String toString() {
    return r'mapPopupProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapPopupNotifier create() => MapPopupNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapPopupState? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapPopupState?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapPopupNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapPopupNotifierHash() => r'0b4dd5aa48b252211dc053c354eecf41e67bb5e5';

final class MapPopupNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MapPopupNotifier,
          MapPopupState?,
          MapPopupState?,
          MapPopupState?,
          Id<Trip>
        > {
  MapPopupNotifierFamily._()
    : super(
        retry: null,
        name: r'mapPopupProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MapPopupNotifierProvider call(Id<Trip> tripId) =>
      MapPopupNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapPopupProvider';
}

abstract class _$MapPopupNotifier extends $Notifier<MapPopupState?> {
  late final _$args = ref.$arg as Id<Trip>;
  Id<Trip> get tripId => _$args;

  MapPopupState? build(Id<Trip> tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapPopupState?, MapPopupState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapPopupState?, MapPopupState?>,
              MapPopupState?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
