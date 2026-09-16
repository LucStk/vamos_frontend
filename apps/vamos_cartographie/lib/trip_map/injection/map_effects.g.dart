// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_effects.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapEffectContext)
final mapEffectContextProvider = MapEffectContextFamily._();

final class MapEffectContextProvider
    extends
        $FunctionalProvider<
          MapEffectContext?,
          MapEffectContext?,
          MapEffectContext?
        >
    with $Provider<MapEffectContext?> {
  MapEffectContextProvider._({
    required MapEffectContextFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapEffectContextProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapEffectContextHash();

  @override
  String toString() {
    return r'mapEffectContextProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<MapEffectContext?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MapEffectContext? create(Ref ref) {
    final argument = this.argument as TripId;
    return mapEffectContext(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapEffectContext? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapEffectContext?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapEffectContextProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapEffectContextHash() => r'bbcad3e9f5a2d0d1aa9cc688316c68119684249b';

final class MapEffectContextFamily extends $Family
    with $FunctionalFamilyOverride<MapEffectContext?, TripId> {
  MapEffectContextFamily._()
    : super(
        retry: null,
        name: r'mapEffectContextProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MapEffectContextProvider call(TripId tripId) =>
      MapEffectContextProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapEffectContextProvider';
}

@ProviderFor(MapEffectResolverNotifier)
final mapEffectResolverProvider = MapEffectResolverNotifierFamily._();

final class MapEffectResolverNotifierProvider
    extends $NotifierProvider<MapEffectResolverNotifier, void> {
  MapEffectResolverNotifierProvider._({
    required MapEffectResolverNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapEffectResolverProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapEffectResolverNotifierHash();

  @override
  String toString() {
    return r'mapEffectResolverProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapEffectResolverNotifier create() => MapEffectResolverNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapEffectResolverNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapEffectResolverNotifierHash() =>
    r'583cc953e44a5510b494921d11ddf93e2472542c';

final class MapEffectResolverNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MapEffectResolverNotifier,
          void,
          void,
          void,
          TripId
        > {
  MapEffectResolverNotifierFamily._()
    : super(
        retry: null,
        name: r'mapEffectResolverProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MapEffectResolverNotifierProvider call(TripId tripId) =>
      MapEffectResolverNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapEffectResolverProvider';
}

abstract class _$MapEffectResolverNotifier extends $Notifier<void> {
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
