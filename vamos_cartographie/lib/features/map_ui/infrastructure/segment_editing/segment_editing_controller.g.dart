// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_editing_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SegmentEditingController)
final segmentEditingControllerProvider = SegmentEditingControllerFamily._();

final class SegmentEditingControllerProvider
    extends $NotifierProvider<SegmentEditingController, Id<Vertex>?> {
  SegmentEditingControllerProvider._({
    required SegmentEditingControllerFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'segmentEditingControllerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentEditingControllerHash();

  @override
  String toString() {
    return r'segmentEditingControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SegmentEditingController create() => SegmentEditingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Id<Vertex>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Id<Vertex>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentEditingControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentEditingControllerHash() =>
    r'1cd4f920b37ac22d361ce1c652fa9d2927a9045d';

final class SegmentEditingControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          SegmentEditingController,
          Id<Vertex>?,
          Id<Vertex>?,
          Id<Vertex>?,
          Id<Trip>
        > {
  SegmentEditingControllerFamily._()
    : super(
        retry: null,
        name: r'segmentEditingControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  SegmentEditingControllerProvider call(Id<Trip> tripId) =>
      SegmentEditingControllerProvider._(argument: tripId, from: this);

  @override
  String toString() => r'segmentEditingControllerProvider';
}

abstract class _$SegmentEditingController extends $Notifier<Id<Vertex>?> {
  late final _$args = ref.$arg as Id<Trip>;
  Id<Trip> get tripId => _$args;

  Id<Vertex>? build(Id<Trip> tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Id<Vertex>?, Id<Vertex>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Id<Vertex>?, Id<Vertex>?>,
              Id<Vertex>?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
