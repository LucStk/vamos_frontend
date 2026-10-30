// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_endpoint_items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Icône de départ de la route, absente tant que le crayon parti d'elle ne
/// l'a pas quittée.

@ProviderFor(sketchOriginItem)
final sketchOriginItemProvider = SketchOriginItemFamily._();

/// Icône de départ de la route, absente tant que le crayon parti d'elle ne
/// l'a pas quittée.

final class SketchOriginItemProvider
    extends
        $FunctionalProvider<
          TripOriginItem<MapRouteOrigin>?,
          TripOriginItem<MapRouteOrigin>?,
          TripOriginItem<MapRouteOrigin>?
        >
    with $Provider<TripOriginItem<MapRouteOrigin>?> {
  /// Icône de départ de la route, absente tant que le crayon parti d'elle ne
  /// l'a pas quittée.
  SketchOriginItemProvider._({
    required SketchOriginItemFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'sketchOriginItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sketchOriginItemHash();

  @override
  String toString() {
    return r'sketchOriginItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<TripOriginItem<MapRouteOrigin>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TripOriginItem<MapRouteOrigin>? create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return sketchOriginItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripOriginItem<MapRouteOrigin>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripOriginItem<MapRouteOrigin>?>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SketchOriginItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sketchOriginItemHash() => r'7ac07ac48de3c7f66788354ad4f4623d082c51f9';

/// Icône de départ de la route, absente tant que le crayon parti d'elle ne
/// l'a pas quittée.

final class SketchOriginItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          TripOriginItem<MapRouteOrigin>?,
          (TripId, MapCameraReader)
        > {
  SketchOriginItemFamily._()
    : super(
        retry: null,
        name: r'sketchOriginItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Icône de départ de la route, absente tant que le crayon parti d'elle ne
  /// l'a pas quittée.

  SketchOriginItemProvider call(TripId tripId, MapCameraReader camera) =>
      SketchOriginItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'sketchOriginItemProvider';
}

/// Icône d'arrivée de la route, même règle.

@ProviderFor(sketchEndItem)
final sketchEndItemProvider = SketchEndItemFamily._();

/// Icône d'arrivée de la route, même règle.

final class SketchEndItemProvider
    extends $FunctionalProvider<TripEndItem?, TripEndItem?, TripEndItem?>
    with $Provider<TripEndItem?> {
  /// Icône d'arrivée de la route, même règle.
  SketchEndItemProvider._({
    required SketchEndItemFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'sketchEndItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sketchEndItemHash();

  @override
  String toString() {
    return r'sketchEndItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<TripEndItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripEndItem? create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return sketchEndItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripEndItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripEndItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SketchEndItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sketchEndItemHash() => r'd8f2abfdeca87fb850d4e858adb952a01f65704e';

/// Icône d'arrivée de la route, même règle.

final class SketchEndItemFamily extends $Family
    with $FunctionalFamilyOverride<TripEndItem?, (TripId, MapCameraReader)> {
  SketchEndItemFamily._()
    : super(
        retry: null,
        name: r'sketchEndItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Icône d'arrivée de la route, même règle.

  SketchEndItemProvider call(TripId tripId, MapCameraReader camera) =>
      SketchEndItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'sketchEndItemProvider';
}
