// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_polyline_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(routePolyline)
final routePolylineProvider = RoutePolylineFamily._();

final class RoutePolylineProvider
    extends $FunctionalProvider<RoutePolyline?, RoutePolyline?, RoutePolyline?>
    with $Provider<RoutePolyline?> {
  RoutePolylineProvider._({
    required RoutePolylineFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'routePolylineProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$routePolylineHash();

  @override
  String toString() {
    return r'routePolylineProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<RoutePolyline?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RoutePolyline? create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return routePolyline(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoutePolyline? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoutePolyline?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RoutePolylineProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$routePolylineHash() => r'ccb35b41c71e53ba7beaf5a427af0cc8f1250bf3';

final class RoutePolylineFamily extends $Family
    with $FunctionalFamilyOverride<RoutePolyline?, (TripId, MapCameraReader)> {
  RoutePolylineFamily._()
    : super(
        retry: null,
        name: r'routePolylineProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  RoutePolylineProvider call(TripId tripId, MapCameraReader camera) =>
      RoutePolylineProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'routePolylineProvider';
}
