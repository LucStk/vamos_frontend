// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_trip_origin_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(createTripOriginItem)
final createTripOriginItemProvider = CreateTripOriginItemFamily._();

final class CreateTripOriginItemProvider
    extends
        $FunctionalProvider<TripOriginItem?, TripOriginItem?, TripOriginItem?>
    with $Provider<TripOriginItem?> {
  CreateTripOriginItemProvider._({
    required CreateTripOriginItemFamily super.from,
    required MapCameraReader super.argument,
  }) : super(
         retry: null,
         name: r'createTripOriginItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createTripOriginItemHash();

  @override
  String toString() {
    return r'createTripOriginItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<TripOriginItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripOriginItem? create(Ref ref) {
    final argument = this.argument as MapCameraReader;
    return createTripOriginItem(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripOriginItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripOriginItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateTripOriginItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createTripOriginItemHash() =>
    r'47075bd576fd8be8f87a0b30faf5fa254127b6d3';

final class CreateTripOriginItemFamily extends $Family
    with $FunctionalFamilyOverride<TripOriginItem?, MapCameraReader> {
  CreateTripOriginItemFamily._()
    : super(
        retry: null,
        name: r'createTripOriginItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CreateTripOriginItemProvider call(MapCameraReader camera) =>
      CreateTripOriginItemProvider._(argument: camera, from: this);

  @override
  String toString() => r'createTripOriginItemProvider';
}
