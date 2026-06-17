// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_interaction_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapInteractionController)
final mapInteractionControllerProvider = MapInteractionControllerFamily._();

final class MapInteractionControllerProvider
    extends $NotifierProvider<MapInteractionController, MapInteractionState> {
  MapInteractionControllerProvider._({
    required MapInteractionControllerFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'mapInteractionControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapInteractionControllerHash();

  @override
  String toString() {
    return r'mapInteractionControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapInteractionController create() => MapInteractionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapInteractionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapInteractionState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapInteractionControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapInteractionControllerHash() =>
    r'f334498d8a823b42978d6e04e3c30d27b0e3ce35';

final class MapInteractionControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          MapInteractionController,
          MapInteractionState,
          MapInteractionState,
          MapInteractionState,
          Id<Trip>
        > {
  MapInteractionControllerFamily._()
    : super(
        retry: null,
        name: r'mapInteractionControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MapInteractionControllerProvider call(Id<Trip> tripId) =>
      MapInteractionControllerProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapInteractionControllerProvider';
}

abstract class _$MapInteractionController
    extends $Notifier<MapInteractionState> {
  late final _$args = ref.$arg as Id<Trip>;
  Id<Trip> get tripId => _$args;

  MapInteractionState build(Id<Trip> tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapInteractionState, MapInteractionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapInteractionState, MapInteractionState>,
              MapInteractionState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
