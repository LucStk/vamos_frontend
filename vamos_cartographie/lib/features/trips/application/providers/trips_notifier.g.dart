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
    extends $NotifierProvider<TripsNotifier, Map<int, TripNode>> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, TripNode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, TripNode>>(value),
    );
  }
}

String _$tripsNotifierHash() => r'ceb4171f72b1bec97d130a89408a7a4d74388a1f';

abstract class _$TripsNotifier extends $Notifier<Map<int, TripNode>> {
  Map<int, TripNode> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Map<int, TripNode>, Map<int, TripNode>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<int, TripNode>, Map<int, TripNode>>,
              Map<int, TripNode>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
