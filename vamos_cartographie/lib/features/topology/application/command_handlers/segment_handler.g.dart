// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SegmentHandler)
final segmentHandlerProvider = SegmentHandlerFamily._();

final class SegmentHandlerProvider
    extends $NotifierProvider<SegmentHandler, void> {
  SegmentHandlerProvider._({
    required SegmentHandlerFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'segmentHandlerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentHandlerHash();

  @override
  String toString() {
    return r'segmentHandlerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SegmentHandler create() => SegmentHandler();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentHandlerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentHandlerHash() => r'1bded14ceccd6b1565edce3d94e5ca62655a8f69';

final class SegmentHandlerFamily extends $Family
    with $ClassFamilyOverride<SegmentHandler, void, void, void, Id<Trip>> {
  SegmentHandlerFamily._()
    : super(
        retry: null,
        name: r'segmentHandlerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentHandlerProvider call(Id<Trip> tripId) =>
      SegmentHandlerProvider._(argument: tripId, from: this);

  @override
  String toString() => r'segmentHandlerProvider';
}

abstract class _$SegmentHandler extends $Notifier<void> {
  late final _$args = ref.$arg as Id<Trip>;
  Id<Trip> get tripId => _$args;

  void build(Id<Trip> tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
