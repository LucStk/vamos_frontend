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
          List<SegMarkerUiElement>,
          List<SegMarkerUiElement>,
          List<SegMarkerUiElement>
        >
    with $Provider<List<SegMarkerUiElement>> {
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
  $ProviderElement<List<SegMarkerUiElement>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<SegMarkerUiElement> create(Ref ref) {
    final argument = this.argument as Id<Trip>;
    return segmentUiNotifier(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SegMarkerUiElement> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SegMarkerUiElement>>(value),
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

String _$segmentUiNotifierHash() => r'72241f88439828ecd8336b9fa0adc42005ac4f24';

final class SegmentUiNotifierFamily extends $Family
    with $FunctionalFamilyOverride<List<SegMarkerUiElement>, Id<Trip>> {
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
