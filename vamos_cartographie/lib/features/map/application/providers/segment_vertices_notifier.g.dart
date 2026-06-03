// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_vertices_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider qui retourne tous les vertices d'un segment (incluant start, middle, end)

@ProviderFor(segmentAllVertices)
final segmentAllVerticesProvider = SegmentAllVerticesFamily._();

/// Provider qui retourne tous les vertices d'un segment (incluant start, middle, end)

final class SegmentAllVerticesProvider
    extends
        $FunctionalProvider<
          List<SegmentVertex>?,
          List<SegmentVertex>?,
          List<SegmentVertex>?
        >
    with $Provider<List<SegmentVertex>?> {
  /// Provider qui retourne tous les vertices d'un segment (incluant start, middle, end)
  SegmentAllVerticesProvider._({
    required SegmentAllVerticesFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'segmentAllVerticesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentAllVerticesHash();

  @override
  String toString() {
    return r'segmentAllVerticesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<SegmentVertex>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<SegmentVertex>? create(Ref ref) {
    final argument = this.argument as (int, int);
    return segmentAllVertices(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SegmentVertex>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SegmentVertex>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentAllVerticesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentAllVerticesHash() =>
    r'bb1e84833e49368429bc93f358ba9e3e303806b4';

/// Provider qui retourne tous les vertices d'un segment (incluant start, middle, end)

final class SegmentAllVerticesFamily extends $Family
    with $FunctionalFamilyOverride<List<SegmentVertex>?, (int, int)> {
  SegmentAllVerticesFamily._()
    : super(
        retry: null,
        name: r'segmentAllVerticesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider qui retourne tous les vertices d'un segment (incluant start, middle, end)

  SegmentAllVerticesProvider call(int tripId, int segmentId) =>
      SegmentAllVerticesProvider._(argument: (tripId, segmentId), from: this);

  @override
  String toString() => r'segmentAllVerticesProvider';
}

/// Provider qui calcule les ghost markers (mi-chemin entre chaque vertex)

@ProviderFor(segmentGhostMarkers)
final segmentGhostMarkersProvider = SegmentGhostMarkersFamily._();

/// Provider qui calcule les ghost markers (mi-chemin entre chaque vertex)

final class SegmentGhostMarkersProvider
    extends
        $FunctionalProvider<
          List<GhostMarkerData>?,
          List<GhostMarkerData>?,
          List<GhostMarkerData>?
        >
    with $Provider<List<GhostMarkerData>?> {
  /// Provider qui calcule les ghost markers (mi-chemin entre chaque vertex)
  SegmentGhostMarkersProvider._({
    required SegmentGhostMarkersFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'segmentGhostMarkersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentGhostMarkersHash();

  @override
  String toString() {
    return r'segmentGhostMarkersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<GhostMarkerData>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<GhostMarkerData>? create(Ref ref) {
    final argument = this.argument as (int, int);
    return segmentGhostMarkers(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<GhostMarkerData>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<GhostMarkerData>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentGhostMarkersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentGhostMarkersHash() =>
    r'e9b02469f82176ffc99607024f1e20fa369d8811';

/// Provider qui calcule les ghost markers (mi-chemin entre chaque vertex)

final class SegmentGhostMarkersFamily extends $Family
    with $FunctionalFamilyOverride<List<GhostMarkerData>?, (int, int)> {
  SegmentGhostMarkersFamily._()
    : super(
        retry: null,
        name: r'segmentGhostMarkersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider qui calcule les ghost markers (mi-chemin entre chaque vertex)

  SegmentGhostMarkersProvider call(int tripId, int segmentId) =>
      SegmentGhostMarkersProvider._(argument: (tripId, segmentId), from: this);

  @override
  String toString() => r'segmentGhostMarkersProvider';
}
