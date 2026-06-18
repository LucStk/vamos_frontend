// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_ui_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segmentUiNotifier)
final segmentUiProvider = SegmentUiNotifierFamily._();

final class SegmentUiNotifierProvider
    extends
        $FunctionalProvider<
          List<SegmentUiElement>,
          List<SegmentUiElement>,
          List<SegmentUiElement>
        >
    with $Provider<List<SegmentUiElement>> {
  SegmentUiNotifierProvider._({
    required SegmentUiNotifierFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'segmentUiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentUiNotifierHash();

  @override
  String toString() {
    return r'segmentUiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<SegmentUiElement>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<SegmentUiElement> create(Ref ref) {
    final argument = this.argument as Id<Trip>;
    return segmentUiNotifier(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SegmentUiElement> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SegmentUiElement>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentUiNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentUiNotifierHash() => r'b0a5a5c9746f21b77e26361547b7cabd0d619b05';

final class SegmentUiNotifierFamily extends $Family
    with $FunctionalFamilyOverride<List<SegmentUiElement>, Id<Trip>> {
  SegmentUiNotifierFamily._()
    : super(
        retry: null,
        name: r'segmentUiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentUiNotifierProvider call(Id<Trip> tripId) =>
      SegmentUiNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'segmentUiProvider';
}
