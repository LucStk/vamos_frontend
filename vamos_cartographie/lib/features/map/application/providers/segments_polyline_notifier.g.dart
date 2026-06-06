// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segments_polyline_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segmentPolylines)
final segmentPolylinesProvider = SegmentPolylinesFamily._();

final class SegmentPolylinesProvider
    extends
        $FunctionalProvider<
          List<Polyline<Object>>,
          List<Polyline<Object>>,
          List<Polyline<Object>>
        >
    with $Provider<List<Polyline<Object>>> {
  SegmentPolylinesProvider._({
    required SegmentPolylinesFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'segmentPolylinesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentPolylinesHash();

  @override
  String toString() {
    return r'segmentPolylinesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Polyline<Object>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<Polyline<Object>> create(Ref ref) {
    final argument = this.argument as int;
    return segmentPolylines(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Polyline<Object>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Polyline<Object>>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentPolylinesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentPolylinesHash() => r'8c14076364fd2e316d94456c9d366e34d687c5a1';

final class SegmentPolylinesFamily extends $Family
    with $FunctionalFamilyOverride<List<Polyline<Object>>, int> {
  SegmentPolylinesFamily._()
    : super(
        retry: null,
        name: r'segmentPolylinesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentPolylinesProvider call(int tripId) =>
      SegmentPolylinesProvider._(argument: tripId, from: this);

  @override
  String toString() => r'segmentPolylinesProvider';
}
