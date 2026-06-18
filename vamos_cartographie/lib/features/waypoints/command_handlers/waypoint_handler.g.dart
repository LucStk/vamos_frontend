// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WaypointHandler)
final waypointHandlerProvider = WaypointHandlerFamily._();

final class WaypointHandlerProvider
    extends $NotifierProvider<WaypointHandler, void> {
  WaypointHandlerProvider._({
    required WaypointHandlerFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'waypointHandlerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointHandlerHash();

  @override
  String toString() {
    return r'waypointHandlerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WaypointHandler create() => WaypointHandler();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointHandlerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointHandlerHash() => r'544bc7dcc94fa1b1b289916ccede76bf1c4a6a20';

final class WaypointHandlerFamily extends $Family
    with $ClassFamilyOverride<WaypointHandler, void, void, void, Id<Trip>> {
  WaypointHandlerFamily._()
    : super(
        retry: null,
        name: r'waypointHandlerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointHandlerProvider call(Id<Trip> tripId) =>
      WaypointHandlerProvider._(argument: tripId, from: this);

  @override
  String toString() => r'waypointHandlerProvider';
}

abstract class _$WaypointHandler extends $Notifier<void> {
  late final _$args = ref.$arg as Id<Trip>;
  Id<Trip> get tripId => _$args;

  void build(Id<Trip> tripId);
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
