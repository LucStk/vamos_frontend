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
          AsyncValue<List<UserTrip>>,
          List<UserTrip>,
          FutureOr<List<UserTrip>>
        >
    with $FutureModifier<List<UserTrip>>, $FutureProvider<List<UserTrip>> {
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
  $FutureProviderElement<List<UserTrip>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserTrip>> create(Ref ref) {
    return myTrips(ref);
  }
}

String _$myTripsHash() => r'fd1fa5f3302038799f05e4ab885c508b8ef7c206';
