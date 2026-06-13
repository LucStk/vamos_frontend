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
    extends $AsyncNotifierProvider<TripsNotifier, Map<Id<Trip>, TripNode>> {
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

String _$tripsNotifierHash() => r'd6a7dfe07ef200225c4ad3923470dfef25e2453e';

abstract class _$TripsNotifier extends $AsyncNotifier<Map<Id<Trip>, TripNode>> {
  FutureOr<Map<Id<Trip>, TripNode>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<Id<Trip>, TripNode>>,
              Map<Id<Trip>, TripNode>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<Id<Trip>, TripNode>>,
                Map<Id<Trip>, TripNode>
              >,
              AsyncValue<Map<Id<Trip>, TripNode>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
