// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segments_polyline_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segmentPolylinePoints)
final segmentPolylinePointsProvider = SegmentPolylinePointsFamily._();

final class SegmentPolylinePointsProvider
    extends $FunctionalProvider<List<LatLng>?, List<LatLng>?, List<LatLng>?>
    with $Provider<List<LatLng>?> {
  SegmentPolylinePointsProvider._({
    required SegmentPolylinePointsFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'segmentPolylinePointsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentPolylinePointsHash();

  @override
  String toString() {
    return r'segmentPolylinePointsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<LatLng>?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<LatLng>? create(Ref ref) {
    final argument = this.argument as (int, int);
    return segmentPolylinePoints(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LatLng>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LatLng>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentPolylinePointsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentPolylinePointsHash() =>
    r'879a699888040bd960c68fff763d26ac00a36a18';

final class SegmentPolylinePointsFamily extends $Family
    with $FunctionalFamilyOverride<List<LatLng>?, (int, int)> {
  SegmentPolylinePointsFamily._()
    : super(
        retry: null,
        name: r'segmentPolylinePointsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentPolylinePointsProvider call(int tripId, int segmentId) =>
      SegmentPolylinePointsProvider._(
        argument: (tripId, segmentId),
        from: this,
      );

  @override
  String toString() => r'segmentPolylinePointsProvider';
}

@ProviderFor(segmentNodes)
final segmentNodesProvider = SegmentNodesFamily._();

final class SegmentNodesProvider
    extends $FunctionalProvider<List<LineNode>, List<LineNode>, List<LineNode>>
    with $Provider<List<LineNode>> {
  SegmentNodesProvider._({
    required SegmentNodesFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'segmentNodesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentNodesHash();

  @override
  String toString() {
    return r'segmentNodesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<LineNode>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<LineNode> create(Ref ref) {
    final argument = this.argument as (int, int);
    return segmentNodes(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LineNode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LineNode>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentNodesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentNodesHash() => r'4a78f4bbe3a4070e26b575e22c6b8b905fdcebff';

final class SegmentNodesFamily extends $Family
    with $FunctionalFamilyOverride<List<LineNode>, (int, int)> {
  SegmentNodesFamily._()
    : super(
        retry: null,
        name: r'segmentNodesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentNodesProvider call(int tripId, int segmentId) =>
      SegmentNodesProvider._(argument: (tripId, segmentId), from: this);

  @override
  String toString() => r'segmentNodesProvider';
}

@ProviderFor(segmentTypePoints)
final segmentTypePointsProvider = SegmentTypePointsFamily._();

final class SegmentTypePointsProvider
    extends $FunctionalProvider<List<LatLng>?, List<LatLng>?, List<LatLng>?>
    with $Provider<List<LatLng>?> {
  SegmentTypePointsProvider._({
    required SegmentTypePointsFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'segmentTypePointsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentTypePointsHash();

  @override
  String toString() {
    return r'segmentTypePointsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<LatLng>?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<LatLng>? create(Ref ref) {
    final argument = this.argument as (int, int);
    return segmentTypePoints(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LatLng>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LatLng>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentTypePointsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentTypePointsHash() => r'1c82b6111b15ec6be47d949fa64ff7d6c51d4dc2';

final class SegmentTypePointsFamily extends $Family
    with $FunctionalFamilyOverride<List<LatLng>?, (int, int)> {
  SegmentTypePointsFamily._()
    : super(
        retry: null,
        name: r'segmentTypePointsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentTypePointsProvider call(int tripId, int segmentId) =>
      SegmentTypePointsProvider._(argument: (tripId, segmentId), from: this);

  @override
  String toString() => r'segmentTypePointsProvider';
}
