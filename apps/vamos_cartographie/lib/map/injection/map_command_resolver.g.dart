// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_command_resolver.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapCommandResolver)
final mapCommandResolverProvider = MapCommandResolverFamily._();

final class MapCommandResolverProvider
    extends
        $FunctionalProvider<
          MapCommandResolver,
          MapCommandResolver,
          MapCommandResolver
        >
    with $Provider<MapCommandResolver> {
  MapCommandResolverProvider._({
    required MapCommandResolverFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapCommandResolverProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapCommandResolverHash();

  @override
  String toString() {
    return r'mapCommandResolverProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<MapCommandResolver> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MapCommandResolver create(Ref ref) {
    final argument = this.argument as TripId;
    return mapCommandResolver(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapCommandResolver value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapCommandResolver>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapCommandResolverProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapCommandResolverHash() =>
    r'd8c9c7d5181a68792d0b5cb6b79eb3a8d91877df';

final class MapCommandResolverFamily extends $Family
    with $FunctionalFamilyOverride<MapCommandResolver, TripId> {
  MapCommandResolverFamily._()
    : super(
        retry: null,
        name: r'mapCommandResolverProvider',
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
        isAutoDispose: false,
      );

  MapCommandResolverProvider call(TripId tripId) =>
      MapCommandResolverProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapCommandResolverProvider';
}
