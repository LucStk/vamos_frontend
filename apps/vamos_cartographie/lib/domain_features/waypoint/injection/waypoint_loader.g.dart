// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_loader.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loadWaypointNotifier)
final loadWaypointProvider = LoadWaypointNotifierFamily._();

final class LoadWaypointNotifierProvider
    extends
        $FunctionalProvider<AsyncValue<Failure?>, Failure?, FutureOr<Failure?>>
    with $FutureModifier<Failure?>, $FutureProvider<Failure?> {
  LoadWaypointNotifierProvider._({
    required LoadWaypointNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'loadWaypointProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadWaypointNotifierHash();

  @override
  String toString() {
    return r'loadWaypointProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Failure?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Failure?> create(Ref ref) {
    final argument = this.argument as TripId;
    return loadWaypointNotifier(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadWaypointNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadWaypointNotifierHash() =>
    r'c3a73545e1644508dc50b363cebc3b50caf79bf1';

final class LoadWaypointNotifierFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Failure?>, TripId> {
  LoadWaypointNotifierFamily._()
    : super(
        retry: null,
        name: r'loadWaypointProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  LoadWaypointNotifierProvider call(TripId tripId) =>
      LoadWaypointNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'loadWaypointProvider';
}
