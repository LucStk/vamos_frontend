// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TripsNotifier)
final tripsProvider = TripsNotifierProvider._();

final class TripsNotifierProvider
    extends $AsyncNotifierProvider<TripsNotifier, Map<Id<Trip>, Trip>> {
  TripsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripsNotifierHash();

  @$internal
  @override
  TripsNotifier create() => TripsNotifier();
}

String _$tripsNotifierHash() => r'23545d7f49b3c160c37bc34bbef839c7c68d3717';

abstract class _$TripsNotifier extends $AsyncNotifier<Map<Id<Trip>, Trip>> {
  FutureOr<Map<Id<Trip>, Trip>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<Map<Id<Trip>, Trip>>, Map<Id<Trip>, Trip>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Map<Id<Trip>, Trip>>, Map<Id<Trip>, Trip>>,
              AsyncValue<Map<Id<Trip>, Trip>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
