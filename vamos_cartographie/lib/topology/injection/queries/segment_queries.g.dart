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
          ObservableGraphNode<Segment>,
          ObservableGraphNode<Segment>,
          ObservableGraphNode<Segment>
        >
    with $Provider<ObservableGraphNode<Segment>> {
  SegmentNodeProvider._({
    required SegmentNodeFamily super.from,
    required SegmentId super.argument,
  }) : super(
         retry: null,
         name: r'segmentNodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentNodeHash();

  @override
  String toString() {
    return r'segmentNodeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ObservableGraphNode<Segment>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableGraphNode<Segment> create(Ref ref) {
    final argument = this.argument as SegmentId;
    return segmentNode(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableGraphNode<Segment> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableGraphNode<Segment>>(value),
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

String _$segmentNodeHash() => r'4a56a49661e210186e509ca0bc028a33c931bef3';

final class SegmentNodeFamily extends $Family
    with $FunctionalFamilyOverride<ObservableGraphNode<Segment>, SegmentId> {
  SegmentNodeFamily._()
    : super(
        retry: null,
        name: r'segmentNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentNodeProvider call(SegmentId id) =>
      SegmentNodeProvider._(argument: id, from: this);

  @override
  String toString() => r'segmentNodeProvider';
}

@ProviderFor(segmentPatchNode)
final segmentPatchNodeProvider = SegmentPatchNodeFamily._();

final class SegmentPatchNodeProvider
    extends
        $FunctionalProvider<
          ObservableGraphNode<SegmentPatch>,
          ObservableGraphNode<SegmentPatch>,
          ObservableGraphNode<SegmentPatch>
        >
    with $Provider<ObservableGraphNode<SegmentPatch>> {
  SegmentPatchNodeProvider._({
    required SegmentPatchNodeFamily super.from,
    required Id<SegmentPatch> super.argument,
  }) : super(
         retry: null,
         name: r'segmentPatchNodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentPatchNodeHash();

  @override
  String toString() {
    return r'segmentPatchNodeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ObservableGraphNode<SegmentPatch>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableGraphNode<SegmentPatch> create(Ref ref) {
    final argument = this.argument as Id<SegmentPatch>;
    return segmentPatchNode(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableGraphNode<SegmentPatch> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableGraphNode<SegmentPatch>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentPatchNodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentPatchNodeHash() => r'87004c8068aeb8695fb75b8375ade7de43e143cb';

final class SegmentPatchNodeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          ObservableGraphNode<SegmentPatch>,
          Id<SegmentPatch>
        > {
  SegmentPatchNodeFamily._()
    : super(
        retry: null,
        name: r'segmentPatchNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentPatchNodeProvider call(Id<SegmentPatch> id) =>
      SegmentPatchNodeProvider._(argument: id, from: this);

  @override
  String toString() => r'segmentPatchNodeProvider';
}

@ProviderFor(segment)
final segmentProvider = SegmentFamily._();

final class SegmentProvider
    extends $FunctionalProvider<Segment, Segment, Segment>
    with $Provider<Segment> {
  SegmentProvider._({
    required SegmentFamily super.from,
    required SegmentId super.argument,
  }) : super(
         retry: null,
         name: r'segmentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentHash();

  @override
  String toString() {
    return r'segmentProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Segment> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Segment create(Ref ref) {
    final argument = this.argument as SegmentId;
    return segment(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Segment value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Segment>(value),
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

String _$segmentHash() => r'd3500458c9ec51304884f6b980e98fe8d564486d';

final class SegmentFamily extends $Family
    with $FunctionalFamilyOverride<Segment, SegmentId> {
  SegmentFamily._()
    : super(
        retry: null,
        name: r'segmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentProvider call(SegmentId id) =>
      SegmentProvider._(argument: id, from: this);

  @override
  String toString() => r'segmentProvider';
}

@ProviderFor(segmentPatch)
final segmentPatchProvider = SegmentPatchFamily._();

final class SegmentPatchProvider
    extends $FunctionalProvider<SegmentPatch, SegmentPatch, SegmentPatch>
    with $Provider<SegmentPatch> {
  SegmentPatchProvider._({
    required SegmentPatchFamily super.from,
    required Id<SegmentPatch> super.argument,
  }) : super(
         retry: null,
         name: r'segmentPatchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentPatchHash();

  @override
  String toString() {
    return r'segmentPatchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SegmentPatch> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SegmentPatch create(Ref ref) {
    final argument = this.argument as Id<SegmentPatch>;
    return segmentPatch(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SegmentPatch value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SegmentPatch>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentPatchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentPatchHash() => r'8df13fc108ba52ad09fd6f608d888d51557d32c4';

final class SegmentPatchFamily extends $Family
    with $FunctionalFamilyOverride<SegmentPatch, Id<SegmentPatch>> {
  SegmentPatchFamily._()
    : super(
        retry: null,
        name: r'segmentPatchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentPatchProvider call(Id<SegmentPatch> id) =>
      SegmentPatchProvider._(argument: id, from: this);

  @override
  String toString() => r'segmentPatchProvider';
}

@ProviderFor(segmentRefs)
final segmentRefsProvider = SegmentRefsProvider._();

final class SegmentRefsProvider
    extends
        $FunctionalProvider<
          List<SegmentRef>,
          List<SegmentRef>,
          List<SegmentRef>
        >
    with $Provider<List<SegmentRef>> {
  SegmentRefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentRefsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentRefsHash();

  @$internal
  @override
  $ProviderElement<List<SegmentRef>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SegmentRef> create(Ref ref) {
    return segmentRefs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SegmentRef> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SegmentRef>>(value),
    );
  }
}

String _$segmentRefsHash() => r'ae09ecff86d16b2c192f24f3b6e15b67e9fbdc93';

@ProviderFor(segmentUi)
final segmentUiProvider = SegmentUiFamily._();

final class SegmentUiProvider
    extends
        $FunctionalProvider<SegmentUiModel?, SegmentUiModel?, SegmentUiModel?>
    with $Provider<SegmentUiModel?> {
  SegmentUiProvider._({
    required SegmentUiFamily super.from,
    required SegmentRef super.argument,
  }) : super(
         retry: null,
         name: r'segmentUiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentUiHash();

  @override
  String toString() {
    return r'segmentUiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SegmentUiModel?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SegmentUiModel? create(Ref ref) {
    final argument = this.argument as SegmentRef;
    return segmentUi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SegmentUiModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SegmentUiModel?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentUiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentUiHash() => r'9ae9496a711f91b92d0c76c32025ee160fcede6d';

final class SegmentUiFamily extends $Family
    with $FunctionalFamilyOverride<SegmentUiModel?, SegmentRef> {
  SegmentUiFamily._()
    : super(
        retry: null,
        name: r'segmentUiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentUiProvider call(SegmentRef id) =>
      SegmentUiProvider._(argument: id, from: this);

  @override
  String toString() => r'segmentUiProvider';
}
