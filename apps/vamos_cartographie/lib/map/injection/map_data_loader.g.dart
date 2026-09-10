// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_data_loader.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripDetailsLoader)
final tripDetailsLoaderProvider = TripDetailsLoaderFamily._();

final class TripDetailsLoaderProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  TripDetailsLoaderProvider._({
    required TripDetailsLoaderFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'tripDetailsLoaderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripDetailsLoaderHash();

  @override
  String toString() {
    return r'tripDetailsLoaderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as TripId;
    return tripDetailsLoader(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TripDetailsLoaderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripDetailsLoaderHash() => r'06f8c469ef942289b8bc72bcb8909c4946b05351';

final class TripDetailsLoaderFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, TripId> {
  TripDetailsLoaderFamily._()
    : super(
        retry: null,
        name: r'tripDetailsLoaderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripDetailsLoaderProvider call(TripId tripId) =>
      TripDetailsLoaderProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripDetailsLoaderProvider';
}
