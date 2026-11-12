// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_layer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allTripItem)
final allTripItemProvider = AllTripItemFamily._();

final class AllTripItemProvider
    extends $FunctionalProvider<List<TripItem>, List<TripItem>, List<TripItem>>
    with $Provider<List<TripItem>> {
  AllTripItemProvider._({
    required AllTripItemFamily super.from,
    required MapCameraReader super.argument,
  }) : super(
         retry: null,
         name: r'allTripItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allTripItemHash();

  @override
  String toString() {
    return r'allTripItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<TripItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<TripItem> create(Ref ref) {
    final argument = this.argument as MapCameraReader;
    return allTripItem(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TripItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TripItem>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllTripItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allTripItemHash() => r'9784cfafbad713376be0ff781425d9941b0a4b67';

final class AllTripItemFamily extends $Family
    with $FunctionalFamilyOverride<List<TripItem>, MapCameraReader> {
  AllTripItemFamily._()
    : super(
        retry: null,
        name: r'allTripItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  AllTripItemProvider call(MapCameraReader camera) =>
      AllTripItemProvider._(argument: camera, from: this);

  @override
  String toString() => r'allTripItemProvider';
}
