// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_trips_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(myTrips)
final myTripsProvider = MyTripsProvider._();

final class MyTripsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TripSummary>>,
          List<TripSummary>,
          FutureOr<List<TripSummary>>
        >
    with
        $FutureModifier<List<TripSummary>>,
        $FutureProvider<List<TripSummary>> {
  MyTripsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myTripsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myTripsHash();

  @$internal
  @override
  $FutureProviderElement<List<TripSummary>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TripSummary>> create(Ref ref) {
    return myTrips(ref);
  }
}

String _$myTripsHash() => r'57b5caa43244fceb3cefd1f0e08bce78d3085032';
