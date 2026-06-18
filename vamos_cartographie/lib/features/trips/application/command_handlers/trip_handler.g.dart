// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TripHandler)
final tripHandlerProvider = TripHandlerProvider._();

final class TripHandlerProvider
    extends $AsyncNotifierProvider<TripHandler, Map<Id<Trip>, Trip>> {
  TripHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripHandlerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripHandlerHash();

  @$internal
  @override
  TripHandler create() => TripHandler();
}

String _$tripHandlerHash() => r'7197ec6d52e9bef8df34c5eaa727e41adf6c25b0';

abstract class _$TripHandler extends $AsyncNotifier<Map<Id<Trip>, Trip>> {
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
