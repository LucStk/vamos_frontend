// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripItem)
final tripItemProvider = TripItemFamily._();

final class TripItemProvider
    extends $FunctionalProvider<TripItem, TripItem, TripItem>
    with $Provider<TripItem> {
  TripItemProvider._({
    required TripItemFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'tripItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripItemHash();

  @override
  String toString() {
    return r'tripItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<TripItem> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripItem create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return tripItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripItem value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripItem>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripItemHash() => r'7104dfe93f5504bec21c92615c6a634bb165a7c5';

final class TripItemFamily extends $Family
    with $FunctionalFamilyOverride<TripItem, (TripId, MapCameraReader)> {
  TripItemFamily._()
    : super(
        retry: null,
        name: r'tripItemProvider',
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
        isAutoDispose: false,
      );

  TripItemProvider call(TripId tripId, MapCameraReader camera) =>
      TripItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'tripItemProvider';
}

@ProviderFor(allTripItem)
final allTripItemProvider = AllTripItemFamily._();

final class AllTripItemProvider
    extends $FunctionalProvider<List<TripItem>, List<TripItem>, List<TripItem>>
    with $Provider<List<TripItem>> {
  AllTripItemProvider._({
    required AllTripItemFamily super.from,
    required MapCameraController super.argument,
  }) : super(
         retry: null,
         name: r'allTripItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = tripItemProvider;

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
    final argument = this.argument as MapCameraController;
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

String _$allTripItemHash() => r'816ce4b2b462021117c1c3ea03218b7a88333143';

final class AllTripItemFamily extends $Family
    with $FunctionalFamilyOverride<List<TripItem>, MapCameraController> {
  AllTripItemFamily._()
    : super(
        retry: null,
        name: r'allTripItemProvider',
        dependencies: <ProviderOrFamily>[tripItemProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          AllTripItemProvider.$allTransitiveDependencies0,
        ],
        isAutoDispose: false,
      );

  AllTripItemProvider call(MapCameraController camera) =>
      AllTripItemProvider._(argument: camera, from: this);

  @override
  String toString() => r'allTripItemProvider';
}
