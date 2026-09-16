// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_transitions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TripMapStateTransitionsNotifier)
final tripMapStateTransitionsProvider =
    TripMapStateTransitionsNotifierFamily._();

final class TripMapStateTransitionsNotifierProvider
    extends $NotifierProvider<TripMapStateTransitionsNotifier, void> {
  TripMapStateTransitionsNotifierProvider._({
    required TripMapStateTransitionsNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'tripMapStateTransitionsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripMapStateTransitionsNotifierHash();

  @override
  String toString() {
    return r'tripMapStateTransitionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TripMapStateTransitionsNotifier create() => TripMapStateTransitionsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripMapStateTransitionsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripMapStateTransitionsNotifierHash() =>
    r'9a5ae425a406d2659b8dad487c7217b1c5938910';

final class TripMapStateTransitionsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TripMapStateTransitionsNotifier,
          void,
          void,
          void,
          TripId
        > {
  TripMapStateTransitionsNotifierFamily._()
    : super(
        retry: null,
        name: r'tripMapStateTransitionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TripMapStateTransitionsNotifierProvider call(TripId tripId) =>
      TripMapStateTransitionsNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripMapStateTransitionsProvider';
}

abstract class _$TripMapStateTransitionsNotifier extends $Notifier<void> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  void build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
