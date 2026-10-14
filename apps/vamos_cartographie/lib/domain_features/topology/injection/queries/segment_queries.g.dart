// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segmentNode)
final segmentNodeProvider = SegmentNodeFamily._();

final class SegmentNodeProvider
    extends
        $FunctionalProvider<
          GraphNode<SegmentFields>,
          GraphNode<SegmentFields>,
          GraphNode<SegmentFields>
        >
    with $Provider<GraphNode<SegmentFields>> {
  SegmentNodeProvider._({
    required SegmentNodeFamily super.from,
    required (TripId, SegmentId) super.argument,
  }) : super(
         retry: null,
         name: r'segmentNodeProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentNodeHash();

  @override
  String toString() {
    return r'segmentNodeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<GraphNode<SegmentFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GraphNode<SegmentFields> create(Ref ref) {
    final argument = this.argument as (TripId, SegmentId);
    return segmentNode(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphNode<SegmentFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphNode<SegmentFields>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentNodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentNodeHash() => r'cba61adc88070f5ec1ecf6680caa99e97581bf27';

final class SegmentNodeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          GraphNode<SegmentFields>,
          (TripId, SegmentId)
        > {
  SegmentNodeFamily._()
    : super(
        retry: null,
        name: r'segmentNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  SegmentNodeProvider call(TripId tripId, SegmentId id) =>
      SegmentNodeProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'segmentNodeProvider';
}

@ProviderFor(segment)
final segmentProvider = SegmentFamily._();

final class SegmentProvider
    extends $FunctionalProvider<SegmentFields, SegmentFields, SegmentFields>
    with $Provider<SegmentFields> {
  SegmentProvider._({
    required SegmentFamily super.from,
    required (TripId, SegmentId) super.argument,
  }) : super(
         retry: null,
         name: r'segmentProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentHash();

  @override
  String toString() {
    return r'segmentProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<SegmentFields> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SegmentFields create(Ref ref) {
    final argument = this.argument as (TripId, SegmentId);
    return segment(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SegmentFields value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SegmentFields>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentHash() => r'e6313903311de6fe846e65321f58c23669534bfc';

final class SegmentFamily extends $Family
    with $FunctionalFamilyOverride<SegmentFields, (TripId, SegmentId)> {
  SegmentFamily._()
    : super(
        retry: null,
        name: r'segmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  SegmentProvider call(TripId tripId, SegmentId id) =>
      SegmentProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'segmentProvider';
}

@ProviderFor(allSegments)
final allSegmentsProvider = AllSegmentsFamily._();

final class AllSegmentsProvider
    extends
        $FunctionalProvider<
          List<SegmentFields>,
          List<SegmentFields>,
          List<SegmentFields>
        >
    with $Provider<List<SegmentFields>> {
  AllSegmentsProvider._({
    required AllSegmentsFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'allSegmentsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allSegmentsHash();

  @override
  String toString() {
    return r'allSegmentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<SegmentFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<SegmentFields> create(Ref ref) {
    final argument = this.argument as TripId;
    return allSegments(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SegmentFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SegmentFields>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllSegmentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allSegmentsHash() => r'b45ce6b74fb9fa909904492316a1685a6357fcba';

final class AllSegmentsFamily extends $Family
    with $FunctionalFamilyOverride<List<SegmentFields>, TripId> {
  AllSegmentsFamily._()
    : super(
        retry: null,
        name: r'allSegmentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  AllSegmentsProvider call(TripId tripId) =>
      AllSegmentsProvider._(argument: tripId, from: this);

  @override
  String toString() => r'allSegmentsProvider';
}
