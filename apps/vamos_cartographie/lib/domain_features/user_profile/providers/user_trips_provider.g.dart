// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_trips_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userTrips)
final userTripsProvider = UserTripsFamily._();

final class UserTripsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserTrip>>,
          List<UserTrip>,
          FutureOr<List<UserTrip>>
        >
    with $FutureModifier<List<UserTrip>>, $FutureProvider<List<UserTrip>> {
  UserTripsProvider._({
    required UserTripsFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'userTripsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userTripsHash();

  @override
  String toString() {
    return r'userTripsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<UserTrip>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserTrip>> create(Ref ref) {
    final argument = this.argument as UserId;
    return userTrips(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserTripsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userTripsHash() => r'0e9f733781c393813ca84c56838fab4155d9349e';

final class UserTripsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<UserTrip>>, UserId> {
  UserTripsFamily._()
    : super(
        retry: null,
        name: r'userTripsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserTripsProvider call(UserId id) =>
      UserTripsProvider._(argument: id, from: this);

  @override
  String toString() => r'userTripsProvider';
}
