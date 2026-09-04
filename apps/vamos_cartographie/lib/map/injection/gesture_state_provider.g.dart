// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gesture_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GestureStateNotifier)
final gestureStateProvider = GestureStateNotifierFamily._();

final class GestureStateNotifierProvider
    extends $NotifierProvider<GestureStateNotifier, GestureState> {
  GestureStateNotifierProvider._({
    required GestureStateNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'gestureStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gestureStateNotifierHash();

  @override
  String toString() {
    return r'gestureStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GestureStateNotifier create() => GestureStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GestureState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GestureState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GestureStateNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gestureStateNotifierHash() =>
    r'4f8d6245d8e73aad7946f0f92c8b766638bbd2b6';

final class GestureStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          GestureStateNotifier,
          GestureState,
          GestureState,
          GestureState,
          TripId
        > {
  GestureStateNotifierFamily._()
    : super(
        retry: null,
        name: r'gestureStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GestureStateNotifierProvider call(TripId tripId) =>
      GestureStateNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'gestureStateProvider';
}

abstract class _$GestureStateNotifier extends $Notifier<GestureState> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  GestureState build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<GestureState, GestureState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GestureState, GestureState>,
              GestureState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
