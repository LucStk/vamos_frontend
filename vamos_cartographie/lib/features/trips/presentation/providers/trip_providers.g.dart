// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TripNotifier)
final tripProvider = TripNotifierFamily._();

final class TripNotifierProvider
    extends $AsyncNotifierProvider<TripNotifier, Trip> {
  TripNotifierProvider._({
    required TripNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'tripProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripNotifierHash();

  @override
  String toString() {
    return r'tripProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TripNotifier create() => TripNotifier();

  @override
  bool operator ==(Object other) {
    return other is TripNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripNotifierHash() => r'b8fb6c73a3cfccf29c503cbf3e3fcedfe14913e3';

final class TripNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TripNotifier,
          AsyncValue<Trip>,
          Trip,
          FutureOr<Trip>,
          int
        > {
  TripNotifierFamily._()
    : super(
        retry: null,
        name: r'tripProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripNotifierProvider call(int tripId) =>
      TripNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripProvider';
}

abstract class _$TripNotifier extends $AsyncNotifier<Trip> {
  late final _$args = ref.$arg as int;
  int get tripId => _$args;

  FutureOr<Trip> build(int tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Trip>, Trip>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Trip>, Trip>,
              AsyncValue<Trip>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
